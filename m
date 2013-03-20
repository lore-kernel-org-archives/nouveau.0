From: Borislav Petkov <bp@alien8.de>
Subject: Re: [Nouveau] nouveau lockdep splat
Date: Wed, 20 Mar 2013 16:29:48 +0100
Message-ID: <20130320152948.GD15471@pd.tnic>
References: <20130304211608.GD22274@pd.tnic>
 <1362501052.1933.2.camel@antimon>
 <20130319202432.GC4570@pd.tnic>
 <1363725620.3413.29.camel@thor.lan>
 <5149589D.6090403@gmail.com>
 <5149D467.7030908@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5149D467.7030908@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lijo Antony <lijo.kernel@gmail.com>
Cc: Peter Hurley <peter@hurleysoftware.com>, Ben Skeggs <bskeggs@redhat.com>, Lucas Stach <dev@lynxeye.de>, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Dave Airlie <airlied@linux.ie>
List-Id: nouveau.vger.kernel.org

On Wed, Mar 20, 2013 at 07:23:19PM +0400, Lijo Antony wrote:
> # bad: [fffddfd6c8e0c10c42c6e2cc54ba880fcc36ebbb] Merge branch
> 'drm-next' of git://people.freedesktop.org/~airlied/linux
> git bisect bad fffddfd6c8e0c10c42c6e2cc54ba880fcc36ebbb

This is a merge commit which means something went wrong along the way of
the bisection.

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
