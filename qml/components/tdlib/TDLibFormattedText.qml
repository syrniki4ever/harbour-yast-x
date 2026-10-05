//@ SPDX-FileCopyrightText: 2026-present roundedrectangle
//@ SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick 2.0
import Sailfish.Silica 1.0
import io.yaqtlib 1.0
import "../../js/twemoji.js" as Emoji

QtObject {
    id: root

    property var formattedText
    property bool ignoreCustomEmoji
    property real emojiSize: Theme.fontSizeSmall

    property var messageData
    property int messageType: Utilities.MessageTextDefault
    property string forumTopicName

    property var textObject: {
        if (formattedText) return utilities.createFormattedText(formattedText, ignoreCustomEmoji)
        if (messageData) return utilities.getMessageFormattedText(messageData, messageType, ignoreCustomEmoji, forumTopicName)
    }

    property bool emojifyNormal: true
    property string text: textObject ? (emojifyNormal ? Emoji.emojify(textObject.parsedText, emojiSize) : textObject.parsedText) : null

    property Binding _sizeBinding: Binding {
        target: textObject
        when: !!textObject
        property: 'customEmojiSize'
        value: Emoji.getEmojiSize(emojiSize)
    }

    // FIXME
    onTextObjectChanged: gc()
    Component.onDestruction: gc()
}
