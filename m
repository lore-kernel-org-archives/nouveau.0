From: Dave Airlie <airlied@gmail.com>
Subject: Re: [Nouveau] Panic in nouveau on resume after 5addcf0a
Date: Thu, 10 Oct 2013 07:34:25 +1000
Message-ID: <CAPM=9tzSNjingreRyVPaHXF4zf6AgaEX_YoqJj7rFmFgwkKQXw@mail.gmail.com>
References: <5255AFFA.60104@gmx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5255AFFA.60104@gmx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Nyhus <martin.nyhus@gmx.com>
Cc: Dave Airlie <airlied@redhat.com>, nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Thu, Oct 10, 2013 at 5:35 AM, Martin Nyhus <martin.nyhus@gmx.com> wrote:
> After 5addcf0a (nouveau: add runtime PM support (v0.9)) I'm getting kernel
> panics immediately after resuming from suspend. Unfortunately it happens so
> early that I don't get any more info than the blinking keyboard lights...
>
> The nouveau tree still panics up to 2fb9d6c, which fails before I can test
> it.

Looks like you've got bigger problems here though, the chip doesn't
seem to initialise properly at all.

does it s/r okay with nouveau.runpm=0 on the command line?

Dave.
