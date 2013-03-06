From: Marcin Slusarz <marcin.slusarz@gmail.com>
Subject: Re: nouveau lockdep splat
Date: Wed, 6 Mar 2013 20:14:18 +0100
Message-ID: <20130306191418.GA3400@joi.lan>
References: <20130304211608.GD22274@pd.tnic>
 <1362501052.1933.2.camel@antimon>
 <20130306000429.GA30189@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130306000429.GA30189@pd.tnic>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@nvidia.com>, Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Borislav Petkov <bp@alien8.de>, Lucas Stach <dev@lynxeye.de>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, Maarten Lankhorst <maarten.lankhorst@canonical.com>
List-Id: nouveau.vger.kernel.org

On Wed, Mar 06, 2013 at 01:04:29AM +0100, Borislav Petkov wrote:
> On Tue, Mar 05, 2013 at 05:30:52PM +0100, Lucas Stach wrote:
> > Dropping Tegra ML, it's not the place where Nouveau mails should go.
> 
> $ ./scripts/get_maintainer.pl -f drivers/gpu/drm/nouveau/nv50_display.c
> ...
> linux-tegra@vger.kernel.org (open list:TEGRA SUPPORT)
> 
> Maybe get_maintainer.pl patterns need correction...

That's new feature (introduced in commit eb90d0855b75f8 "get_maintainer: allow
keywords to match filenames") of get_maintainer.pl which now can look at file
contents...

TEGRA SUPPORT
M:	Stephen Warren <swarren@wwwdotorg.org>
L:	linux-tegra@vger.kernel.org
Q:	http://patchwork.ozlabs.org/project/linux-tegra/list/
T:	git git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git
S:	Supported
K:	(?i)[^a-z]tegra

Note the last line and this:

$ grep tegra drivers/gpu/drm/nouveau/nv50_display.c
        u32 rekey = 56; /* binary driver, and tegra constant */
        max_ac_packet -= 18; /* constant from tegra */

Fun.

Marcin
