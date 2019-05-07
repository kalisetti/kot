var tray = require('tray-windows')
 
tray({
  name: 'Tooltip title',
  items: ['A','B','C'],
  icon: tray.icons.green()
}, function (err, app) {
  if (err) { throw err }
 
  app.on('click:menuItem', function (item) {
    console.log(item)
    // {index: 0, text: 'A'}
  })
 
  app.addMenuItem('D')
  app.delMenuItem('B')
  app.delMenuItemAt(1) // 0-based index
  app.dropMenu() // remove all menu items
  app.exit() // close the tray app; node still running
 
  app.updateIcon(tray.icons.red())
})