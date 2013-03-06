From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: nouveau lockdep splat
Date: Wed, 06 Mar 2013 12:31:49 -0700
Message-ID: <513799A5.3010609@wwwdotorg.org>
References: <20130304211608.GD22274@pd.tnic> <1362501052.1933.2.camel@antimon>
	<20130306000429.GA30189@pd.tnic> <20130306191418.GA3400@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <20130306191418.GA3400@joi.lan>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Marcin Slusarz <marcin.slusarz@gmail.com>
Cc: Stephen Warren <swarren@nvidia.com>, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Borislav Petkov <bp@alien8.de>, Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>
List-Id: nouveau.vger.kernel.org

On 03/06/2013 12:14 PM, Marcin Slusarz wrote:
> On Wed, Mar 06, 2013 at 01:04:29AM +0100, Borislav Petkov wrote:
>> On Tue, Mar 05, 2013 at 05:30:52PM +0100, Lucas Stach wrote:
>>> Dropping Tegra ML, it's not the place where Nouveau mails should go.
>>
>> $ ./scripts/get_maintainer.pl -f drivers/gpu/drm/nouveau/nv50_display.c
>> ...
>> linux-tegra@vger.kernel.org (open list:TEGRA SUPPORT)
>>
>> Maybe get_maintainer.pl patterns need correction...
> 
> That's new feature (introduced in commit eb90d0855b75f8 "get_maintainer: allow
> keywords to match filenames") of get_maintainer.pl which now can look at file
> contents...

get_maintainer.pl could always look at file contents IIRC. The change
was that I added keyword "tegra" to the Tegra section that now matches
this file's contents.

./scripts/get_maintainer.pl -f drivers/gpu/drm/nouveau

... might be a better invocation, although perhaps I should add an
explicit exclusion for "nouveau" to the Tegra section in MAINTAINERS.
