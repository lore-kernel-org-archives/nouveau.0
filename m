From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: (no subject)
Date: Wed, 26 Feb 2020 13:57:08 +0200
Message-ID: <86d0ec$ae4ffc@fmsmga001.fm.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1434613373=="
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Josh Wu <josh.wu@atmel.com>, Bhuvanchandra DV <bhuvanchandra.dv@toradex.com>, Neil Armstrong <narmstrong@baylibre.com>, Eric Anholt <eric@anholt.net>, nouveau@lists.freedesktop.org, Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, Gustaf =?iso-8859-1?Q?Lindstr=F6m?= <gl@axentia.se>, Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Philipp Zabel <philipp.zabel@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>, Jagan Teki <jagan@amarulasolutions.com>, Thomas Hellstrom <thellstrom@vmware.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Jonathan Marek <jonathan@marek.ca>, Stefan Mavrodiev <stefan@olimex.com>, Adam Ford <aford173@gmail.com>, Jerry Han <hanxu5@huaqin.corp-partner.google.com>, VMware
List-Id: nouveau.vger.kernel.org

--===============1434613373==
Content-Type: text/plain

Subject: Re: [PATCH 04/12] drm: Nuke mode->vrefresh
Message-ID: <20200226115708.GH13686@intel.com>
References: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
 <CGME20200219203620eucas1p24b4990a91e758dbcf3e9b943669b0c8f@eucas1p2.samsung.com>
 <20200219203544.31013-5-ville.syrjala@linux.intel.com>
 <0f278771-79ce-fe23-e72c-3935dbe82d24@samsung.com>
 <20200225112114.GA13686@intel.com>
 <3ca785f2-9032-aaf9-0965-8657d31116ba@samsung.com>
 <20200225154506.GF13686@intel.com>
 <20200225192720.GG13686@intel.com>
 <CACRpkdZk9QEy+Kzkmy4BXiHB+aq9hprf=dmA_-R23yqH3NCt1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZk9QEy+Kzkmy4BXiHB+aq9hprf=dmA_-R23yqH3NCt1g@mail.gmail.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Feb 25, 2020 at 10:52:25PM +0100, Linus Walleij wrote:
> On Tue, Feb 25, 2020 at 8:27 PM Ville Syrjälä
> <ville.syrjala@linux.intel.com> wrote:
> 
> > OK, so I went ahead a wrote a bit of cocci [1] to find the bad apples.
> 
> That's impressive :D
> 
> > Unfortunately it found a lot of strange stuff:
> 
> I will answer for the weirdness I caused.
> 
> I have long suspected that a whole bunch of the "simple" displays
> are not simple but contains a display controller and memory.
> That means that the speed over the link to the display and
> actual refresh rate on the actual display is asymmetric because
> well we are just updating a RAM, the resolution just limits how
> much data we are sending, the clock limits the speed on the
> bus over to the RAM on the other side.

IMO even in command mode mode->clock should probably be the actual
dotclock used by the display. If there's another clock for the bus
speed/etc. it should be stored somewhere else.

-- 
Ville Syrjälä
Intel

--===============1434613373==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============1434613373==--
