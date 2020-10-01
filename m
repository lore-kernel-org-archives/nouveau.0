From: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
Subject: Re: Nouveau wiki migration
Date: Thu, 1 Oct 2020 19:52:57 +0200
Message-ID: <20201001175257.GA188932@ravnborg.org>
References: <CACO55ts6hfd_v8V8_yJ45wm8MAN7TENL9pZZmijFaB3h-FrR=A@mail.gmail.com>
 <CACO55tviMespp4FNko+2ipmx0DNx4de2WKSrmEW05EufW7P_ZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACO55tviMespp4FNko+2ipmx0DNx4de2WKSrmEW05EufW7P_ZA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hi Karol.

On Thu, Oct 01, 2020 at 01:36:52PM +0200, Karol Herbst wrote:
> On Fri, Sep 25, 2020 at 11:27 PM Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> >
> > Hi everybody,
> >
> > I think it's time to finally move our wiki from the old infrastructure
> > over to gitlab pages.
> >
> > This comes with several benefits:
> > * full control through git over the ikiwiki pipeline (setup files,
> > plugins, system packages, ...)
> > * random users are able to create MRs against the wiki as long as they
> > are willing to create a gitlab account.
> > * possible to migrate over to a different wiki generator or mix and
> > match or whatever.
> > * no CGI stuff on the wiki as we don't use ikiwiki for the git
> > operations anymore
> >
> > To view the migrate wiki visit this URL:
> > https://nouveau.pages.freedesktop.org/wiki/

I poked around a little - almost all of it looked good.

The FAQ points back to some pages on https://nouveau.freedesktop.org -
like https://nouveau.freedesktop.org/wiki/XvMC/
I guess this is a bug.

But in general looks good.

> I did some further changes, like ensuring backwards compatibility to
> existing links and already started to clean up some bits, like
> removing the google translate stuff.
> 
> Now I'd like to get the subdomain changed of the current wiki over to
> the gitlab stuff and wanted to ask for acks/nacks on this

No ack/nack here - as I really do not know what to ack/nack.
But maybe the above counts like an ack???

But looks good and I hope that others find it simple to help
with the pages from the gitlab repo.

	Sam
