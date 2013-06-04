From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [REGRESSION] nouveau: Resume hung after protecting against client
 races (MBA3,1)
Date: Tue, 4 Jun 2013 17:16:45 -0400
Message-ID: <CAKb7UvhizpvM5FQNcdq=zFN0cTgTT=_saj_gX9EMt=ND8Oibcw@mail.gmail.com>
References: <1341469873-1582-1-git-send-email-rydberg@euromail.se>
	<20130604204801.GA1168@polaris.bitmath.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130604204801.GA1168@polaris.bitmath.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Henrik Rydberg <rydberg@euromail.se>
Cc: Dave Airlie <airlied@redhat.com>, nouveau@lists.freedesktop.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Tue, Jun 4, 2013 at 4:48 PM, Henrik Rydberg <rydberg@euromail.se> wrote:
> Hi Ben,
>
> The new mutexes in nvc0/nv50 (fadb17190/b509656) break resume on my
> MBA3,1. A dead-lock somewhere, perhaps? Reverting fixes the problem.

A bunch of people saw it earlier. Fixed for nv50 (which is what I
assume you have) in
http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=e9de89adcecb7a1296f5bc4d0052f58e18edd0a8

I assume it's on its way to mainline.

  -ilia
