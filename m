From: Borislav Petkov <bp@alien8.de>
Subject: Re: nouveau lockdep splat
Date: Wed, 6 Mar 2013 20:53:42 +0100
Message-ID: <20130306195342.GF30673@pd.tnic>
References: <20130304211608.GD22274@pd.tnic>
 <1362501052.1933.2.camel@antimon>
 <20130306000429.GA30189@pd.tnic>
 <20130306191418.GA3400@joi.lan>
 <513799A5.3010609@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <513799A5.3010609@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Marcin Slusarz <marcin.slusarz@gmail.com>, Stephen Warren <swarren@nvidia.com>, Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>, Lucas Stach <dev@lynxeye.de>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, Maarten Lankhorst <maarten.lankhorst@canonical.com>
List-Id: nouveau.vger.kernel.org

On Wed, Mar 06, 2013 at 12:31:49PM -0700, Stephen Warren wrote:
> get_maintainer.pl could always look at file contents IIRC. The change
> was that I added keyword "tegra" to the Tegra section that now matches
> this file's contents.
> 
> ./scripts/get_maintainer.pl -f drivers/gpu/drm/nouveau
> 
> ... might be a better invocation, although perhaps I should add an
> explicit exclusion for "nouveau" to the Tegra section in MAINTAINERS.

No, you should add a pattern which matches only tegra. If there's no
such pattern, you should simply drop the "K:" thing.

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
