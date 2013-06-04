From: "Henrik Rydberg" <rydberg@euromail.se>
Subject: [REGRESSION] nouveau: Resume hung after protecting against client
 races (MBA3,1)
Date: Tue, 4 Jun 2013 22:48:01 +0200
Message-ID: <20130604204801.GA1168@polaris.bitmath.org>
References: <1341469873-1582-1-git-send-email-rydberg@euromail.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1341469873-1582-1-git-send-email-rydberg@euromail.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Henrik Rydberg <rydberg@euromail.se>
Cc: Dave Airlie <airlied@redhat.com>, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Hi Ben,

The new mutexes in nvc0/nv50 (fadb17190/b509656) break resume on my
MBA3,1. A dead-lock somewhere, perhaps? Reverting fixes the problem.

Thanks,
Henrik
