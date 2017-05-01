From: Joseph Salisbury <joseph.salisbury@canonical.com>
Subject: [REGRESSION][v4.11-rc7] drm/nouveau: initial support (display-only)
 for GP107
Date: Mon, 1 May 2017 15:32:28 -0400
Message-ID: <e38122e9-9e8d-2983-9137-bcc8ca849206@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: Ben Skeggs <bskeggs@redhat.com>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, David Airlie <airlied@linux.ie>, karolherbst@gmail.com, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, costamagnagianfranco@ubuntu.com
List-Id: nouveau.vger.kernel.org

Hi Ben,

A kernel bug report was opened against Ubuntu [0].  After a kernel
bisect, it was found that reverting the following commit resolved this bug:

commit da2ba564a6dcf46df4f828624ff55531ff11d5b0
Author: Ben Skeggs <bskeggs@redhat.com>
Date:   Thu Apr 6 10:35:26 2017 +1000

    drm/nouveau: initial support (display-only) for GP107


The regression was introduced as of v4.11-rc7.

I was hoping to get your feedback, since you are the patch author.  Do
you think gathering any additional data will help diagnose this issue,
or would it be best to submit a revert request?


Thanks,

Joe

[0] http://pad.lv/1685865
