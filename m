From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: (no subject)
Date: Wed, 26 Feb 2020 16:34:09 +0200
Message-ID: <20200226143409.GJ13686@intel.com>
References: <86d0ec$ae4ffc@fmsmga001.fm.intel.com>
 <CACRpkdZ4H5fdWsxsXnsbyxb6fwKbgm0h5a6CdqEjU9w5+z0a7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZ4H5fdWsxsXnsbyxb6fwKbgm0h5a6CdqEjU9w5+z0a7Q@mail.gmail.com>
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

On Wed, Feb 26, 2020 at 01:08:06PM +0100, Linus Walleij wrote:
> On Wed, Feb 26, 2020 at 12:57 PM Ville Syrj=E4l=E4
> <ville.syrjala@linux.intel.com> wrote:
> > On Tue, Feb 25, 2020 at 10:52:25PM +0100, Linus Walleij wrote:
> =

> > > I have long suspected that a whole bunch of the "simple" displays
> > > are not simple but contains a display controller and memory.
> > > That means that the speed over the link to the display and
> > > actual refresh rate on the actual display is asymmetric because
> > > well we are just updating a RAM, the resolution just limits how
> > > much data we are sending, the clock limits the speed on the
> > > bus over to the RAM on the other side.
> >
> > IMO even in command mode mode->clock should probably be the actual
> > dotclock used by the display. If there's another clock for the bus
> > speed/etc. it should be stored somewhere else.
> =

> Good point. For the DSI panels we have the field hs_rate
> for the HS clock in struct mipi_dsi_device which is based
> on exactly this reasoning. And that is what I actually use for
> setting the HS clock.
> =

> The problem is however that we in many cases have so
> substandard documentation of these panels that we have
> absolutely no idea about the dotclock. Maybe we should
> just set it to 0 in these cases?

Don't you always have a TE interrupt or something like that
available? Could just measure it from that if no better
information is available?

-- =

Ville Syrj=E4l=E4
Intel
