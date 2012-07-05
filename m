From: "Henrik Rydberg" <rydberg@euromail.se>
Subject: Re: [REGRESSION] nouveau: Memory corruption using nva3 engine for
 0xaf
Date: Thu, 5 Jul 2012 08:54:46 +0200
Message-ID: <20120705065446.GA1849@polaris.bitmath.org>
References: <1341469873-1582-1-git-send-email-rydberg@euromail.se>
 <20120705064049.GA8693@nisroch.bne.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120705064049.GA8693@nisroch.bne.redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Skeggs <skeggsb@gmail.com>
Cc: Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

> Thanks for tracking down the source of this corruption.  I don't have
> any such hardware, so until someone can figure it out, I think we
> should apply this patch.

In that case, I would have to massage the patch a bit first; it
creates a problem with suspend/resume. Might be something with
nva3_pm.c, who knows. I am really stabbing in the dark here. :-)

Thanks,
Henrik
