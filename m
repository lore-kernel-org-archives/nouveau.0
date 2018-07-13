From: Lyude Paul <lyude@redhat.com>
Subject: [PATCH 0/2] drm/nouveau: Fix connector memory corruption issues
Date: Fri, 13 Jul 2018 12:24:39 -0400
Message-ID: <20180713162442.22522-1-lyude@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: nouveau@lists.freedesktop.org
Cc: Karol Herbst <karolherbst@gmail.com>, stable@vger.kernel.org, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

This fixes some nasty issues I found in nouveau that were being caused
looping through connectors using racy legacy methods, along with some
caused by making incorrect assumptions about the drm_connector structs
in nouveau's connector list. Most of these memory corruption issues
could be reproduced by using an MST hub with nouveau.

Cc: Karol Herbst <karolherbst@gmail.com>
Cc: stable@vger.kernel.org

Lyude Paul (2):
  drm/nouveau: Use drm_connector_list_iter_* for iterating ues connectors
  drm/nouveau: Avoid looping through fake MST connectors

 drivers/gpu/drm/nouveau/nouveau_backlight.c |  6 ++--
 drivers/gpu/drm/nouveau/nouveau_connector.c |  9 ++++--
 drivers/gpu/drm/nouveau/nouveau_connector.h | 36 ++++++++++++++++++---
 drivers/gpu/drm/nouveau/nouveau_display.c   | 10 ++++--
 4 files changed, 51 insertions(+), 10 deletions(-)

-- 
2.17.1
