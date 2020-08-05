"use strict";

/**
 * Requires.
 */

var def = require("../default");

var Promise = require("es6-promise").Promise;

var extend = require("extend");

var fs = require("fs");

var fse = require("fs-extra");

var path = require("path");

var sassdocExtras = require("sassdoc-extras");

var swig = require("./swig");

/**
 * Parse options and defaults.
 *
 * @param ctx
 */

var applyDefaults = function(ctx) {
  return extend({}, def, ctx, {
    groups: extend(def.groups, ctx.groups),
    display: extend(def.display, ctx.display)
  });
};

/**
 * Compile and render index.
 *
 * @param template
 * @param ctx
 * @param dest
 * @returns {boolean}
 */

var buildDocs = function(template, ctx, dest) {
  for(var group in ctx.data.byGroupAndType) {
    // Set current group name.
    ctx.data.currentGroupName = ctx.groups[group];
    // Set current group.
    ctx.data.currentGroup = ctx.data.byGroupAndType[group];

    const filePath = path.resolve(dest, group + '.html.md');
    ensureDirectoryExistence(filePath);

    // Write file to destination.
    fs.writeFileSync(
      filePath,
      swig.renderFile(template, ctx),
      { flag: 'w' }
    );
  }
  return true;
}

function ensureDirectoryExistence(filePath) {
  var dirname = path.dirname(filePath);
  if (fs.existsSync(dirname)) {
    return true;
  }
  ensureDirectoryExistence(dirname);
  fs.mkdirSync(dirname);
}


/**
 * Copy pages to destination.
 *
 * @param ctx
 * @param dest
 * @returns boolean
 */

var buildPages = function(ctx, dest) {
  if (ctx.pagesFrom) {
    // Copy pages from option to destination.
    var from = path.resolve(__dirname, ctx.pagesFrom);
    var to = path.resolve(dest);
    return fse.copySync(from, to);
  } else {
    return false;
  }
}

/**
 * Export.
 *
 * @param dest
 * @param ctx
 * @returns {*}
 */

module.exports = function (dest, ctx) {
  // Resolve entry template.
  var groupTemplate = path.resolve(__dirname, "../templates/group.markdown.swig");

  // Extend defaults.
  ctx = applyDefaults(ctx);

  // Sassdoc extras.
  sassdocExtras(ctx, "display", "groupName");

  // Set by group and type to sorted data by group and type.
  ctx.data.byGroupAndType = sassdocExtras.byGroupAndType(ctx.data);

  // Construct.
  return Promise.all([buildDocs(groupTemplate, ctx, dest), buildPages(ctx, dest)]);

};
