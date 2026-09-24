import QtQuick
import Quickshell
import qs.Commons
import qs.Ui

// Bar button for bin/omarot13.
//
// Left click rotates the selected text (falling back to the clipboard), right
// click rotates the clipboard. The result lands on the clipboard either way.
BarWidget {
  id: root
  moduleName: "io.github.han-rucan.omarot13"

  readonly property string script: decodeURIComponent(String(Qt.resolvedUrl("bin/omarot13")).replace(/^file:\/\//, ""))

  function rotate(mode) {
    Quickshell.execDetached(mode ? [script, mode] : [script])
  }

  implicitWidth: button.implicitWidth
  implicitHeight: button.implicitHeight

  // Default glyph is nf-md-incognito (U+F05F9): ROT13 disguises text rather
  // than securing it.
  BarIconButton {
    id: button
    anchors.fill: parent
    bar: root.bar
    text: root.setting("icon", "\udb81\uddf9")
    tooltipText: "ROT13 selection → clipboard (right click: clipboard)"
    onPressed: function(b) {
      root.rotate(b === Qt.RightButton ? "--clipboard" : "")
    }
  }
}
