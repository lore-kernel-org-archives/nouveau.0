From: Anssi Hannula <anssi.hannula-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH] nouveau: detect incompatible libglx.so
Date: Fri, 4 Jun 2010 00:23:58 +0300
Message-ID: <201006040023.59188.anssi.hannula@iki.fi>
References: <20100523194916.GB15846@joi.lan> <20100602163856.GB2973@joi.lan>
	<20100603121554.GA3071@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100603121554.GA3071-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Marcin Slusarz kirjoitti torstai, 3. kes=E4kuuta 2010 15:15:54:
> On Wed, Jun 02, 2010 at 06:38:56PM +0200, Marcin Slusarz wrote:
> > On Wed, Jun 02, 2010 at 08:40:54AM +1000, Ben Skeggs wrote:
> > > On Tue, 2010-06-01 at 20:15 +0200, Marcin Slusarz wrote:
> > > > On Sun, May 23, 2010 at 09:49:16PM +0200, Marcin Slusarz wrote:
> > > > > Exit with proper message instead of crashing when user forgot
> > > > > to uninstall the proprietary driver.
> > > > > =

> > > > > Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > > > > ---
> > > > > =

> > > > >  src/nv_driver.c |   35 +++++++++++++++++++++++++++++++++++
> > > > >  1 files changed, 35 insertions(+), 0 deletions(-)
> > > > =

> > > > ping
> > > =

> > > I question the need for this.  I quite often use nouveau with NVIDIA's
> > > libglx installed and don't see this crashing you report.
> > =

> > Really? It crashes for me every time. Maybe you were having libglx.so,
> > but no (NVIDIA's) libGLcore.so (etc), so glx extension was disabled?
> =

> Hmm, I can't reproduce it anymore...

For the record, IIRC this crash was recently fixed in mesa by a nvidia =

provided patch.

-- =

Anssi Hannula
