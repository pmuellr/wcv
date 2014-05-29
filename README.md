wcv - workspace, columns, views
================================================================================

wcv is a web user interface contruct that manages a **workspace** as a set of
**columns** and **views**.

wcv was heavily inspired by the Plan 9
[help](http://www.google.com/search?q=A+Minimalist+Global+User+Interface+Pike)
and
[acme](http://www.google.com/search?q=Acme%3A+A+User+Interface+for+Programmers+Pike)
"editors".



overview
================================================================================

A **workspace** lives in a web browser context, as a `<div>`.
The **workspace** is divided into **columns**, which completely fill
the width of the **workspace**.  The **columns** are child `<div>`s of the
**workspace** `<div>`.

Each column consists of **views**, oriented
as rows within each **column**. The **views** in a **column** completely fill
the height of the **workspace**. The **views** are child `<div>`s of a
**column** `<div>`.

A **workspace** does not scroll columns,
and **columns** do not scroll **views**.

The width of the **columns** of a **workspace** can be resized manually.
As the **workspace** window is resized narrower or wider,
the **columns** are resized proportionally.

The height of the **views** of a **column** can be resized manually.
As the **workspace** window is resized shorter or taller,
the **views** are resized proportionally.

In a **workspace**, you can do the following with **columns**:

* add a new **column**
* remove a **column**
* reorder **columns**
* collapse/restore **columns**

In a **column**, you can do the following with **views**:

* add a new **view**
* remove a **view**
* reorder **views**
* collapse/restore **views**

You can also move **views** from one **column** to another.



styling
================================================================================




api
================================================================================

The wcv api is rooted off of an object `wcv`, presumably provided as a module
or as a global variable.  We will refer to this object as `wcv` throughout this
document.  Other objects referenced include `workspace`, `column`, and `view`,
which represent their respective objects.

`wcv.createWorkspace(div)`

`wcv.deleteWorkspace(div)`

`wcv.getWorkspaces()`

`wcv.setHeaderWorkspace(div)`

`wcv.setHeaderColumn(div)`

`wcv.setHeaderView(div)`

`workspace.createColumn()`

`workspace.deleteColumn(column)`

`workspace.getColumns()`

`workspace.moveColumn(column, index)`

`workspace.data`

`column.getWorkspace()`

`column.createView()`

`column.deleteView(view)`

`column.getViews()`

`column.moveView(view, index)`

`column.moveView(view, column, index)`

`column.getWidth()`

`column.setWidth()`

`column.getWidthPercentage()`

`column.setWidthPercentage()`

`column.collapse()`

`column.restore()`

`column.isCollapsed()`

`column.data`

`view.getColumn()`

`view.getHeight()`

`view.setHeight()`

`view.getHeightPercentage()`

`view.setHeightPercentage()`

`view.collapse()`

`view.restore()`

`view.isCollapsed()`

`view.setContentDiv()`

`view.getContentDiv()`

`view.data`


events
================================================================================


workspaces, columns, and views are event emitters, which support the
following events:

`created`   - when the object is created

`destroyed` - when the object is destroyed

`resized`   - when the object is resized

`moved`     - when the object is moved (not sent to workspaces)

ui gestures
================================================================================

You can optionally enable some default user interface gestures for items
in a workspace.

`workspace.gestures.columnMove([class])`

`workspace.gestures.viewMove([class])`

These APIs enable, disable, and return the current setting for default
gestures to move columns and views.  When called with a `class` parameter,
the gesture will be disabled if `class` is the empty string; the
gesture will be enabled if `class` is not the empty string.  If you pass
no class, or `null` or `undefined`, you get the current setting - an
empty string or a non-empty string.

The `class` parameter should identify a class which can be used as a drag-able
element to move the object, presumably in a template; eg, a titlebar or a
drag indicator.

`workspace.gestures.columnResize([boolean])`

`workspace.gestures.viewResize([boolean])`

These gestures allow columns and views to be resized, by dragging near the
objects move-able borders - ie, vertical lines for columns, horizontal lines
for rows.

When a resize occurs, the two objects bordering the relevant line are
resized, so that they continue to use the same amount of space together,
as they did before the resize.  `resize` events will be sent to both
objects.
