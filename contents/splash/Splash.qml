/*
 *   Copyright 2014 Marco Martin <mart@kde.org>
 *   Copyright 2024 R. van Elst <raymii.org>
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License version 2,
 *   or (at your option) any later version, as published by the Free
 *   Software Foundation
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details
 *
 *   You should have received a copy of the GNU General Public
 *   License along with this program; if not, write to the
 *   Free Software Foundation, Inc.,
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

import QtQuick 2.5
import QtQuick.Window 2.2

Rectangle {
    id: root
    color: "#313131"
    property int stage
    onStageChanged: {
        if (stage == 1) {
            introAnimation.running = true
        }
        if (stage == 4) {
            introAnimation.running = false
        }
    }

    Item {
        id: content
        anchors.fill: parent
        opacity: 0
        TextMetrics {
            id: units
            text: "M"
            property int gridUnit: boundingRect.height
            property int largeSpacing: units.gridUnit
            property int smallSpacing: Math.max(2, gridUnit/4)
        }

        Rectangle {
            property int sizeAnim: 64
            id: imageSource
            width:  sizeAnim * 4
            height: sizeAnim * 4
            color:  "transparent"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            clip: true
     
            AnimatedImage { 
                id: spinner
                source: "images/spinner.gif"
                paused: false
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                width:  imageSource.sizeAnim
                height: imageSource.sizeAnim
                smooth: true
                visible: true 
             }             
             
            Row {
                spacing: units.smallSpacing * 0.5
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                
                Text {
                    color: "#eff0f1"
                    font.pointSize: 24
                    // Work around Qt bug where NativeRendering breaks for non-integer scale factors
                    // https://bugreports.qt.io/browse/QTBUG-67007
                    renderType: Screen.devicePixelRatio % 1 !== 0 ? Text.QtRendering : Text.NativeRendering
                    text: "Please Wait"
                }     
            }                      
        }  
    }

    OpacityAnimator {
        id: introAnimation
        running: false
        target: content
        from: 0
        to: 1
        duration: 1000
        easing.type: Easing.InOutQuad
    }
}
