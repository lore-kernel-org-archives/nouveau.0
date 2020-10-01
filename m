From: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Nouveau wiki migration
Date: Thu, 1 Oct 2020 13:36:52 +0200
Message-ID: <CACO55tviMespp4FNko+2ipmx0DNx4de2WKSrmEW05EufW7P_ZA@mail.gmail.com>
References: <CACO55ts6hfd_v8V8_yJ45wm8MAN7TENL9pZZmijFaB3h-FrR=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACO55ts6hfd_v8V8_yJ45wm8MAN7TENL9pZZmijFaB3h-FrR=A@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: Daniel Stone <daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Fri, Sep 25, 2020 at 11:27 PM Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>
> Hi everybody,
>
> I think it's time to finally move our wiki from the old infrastructure
> over to gitlab pages.
>
> This comes with several benefits:
> * full control through git over the ikiwiki pipeline (setup files,
> plugins, system packages, ...)
> * random users are able to create MRs against the wiki as long as they
> are willing to create a gitlab account.
> * possible to migrate over to a different wiki generator or mix and
> match or whatever.
> * no CGI stuff on the wiki as we don't use ikiwiki for the git
> operations anymore
>
> To view the migrate wiki visit this URL:
> https://nouveau.pages.freedesktop.org/wiki/
> the gitlab project lives here: https://gitlab.freedesktop.org/nouveau/wiki
>
> There are a couple of changes I already made:
> * convert the perl ikiwiki setup file to yaml:
> https://gitlab.freedesktop.org/nouveau/wiki/-/blob/master/nouveau.yml
> * reworked the setup file to throw out unused plugins and adjust
> settings for gitlab
> * enabled HTML5 (does change the style slightly, but also fixed some
> regressions)
> * pulled in external sources (from the fdo.org server)
> * moved mdwn files into their own subdirectory
>
> For now I changed everything inside one big commit:
> https://gitlab.freedesktop.org/nouveau/wiki/-/commit/6f2d1669884af186863718ad827f65372a0c5c43
>
> There are a couple of remaining issues/questions:
> * the gitlab CI pipeline fails quite a bit, which could be annoying
> * there is a delay between editing and changes going live (usually
> below a minute though)
> * should we disallow direct editing of files for project members so we
> could CI the changes are still valid?
>
> Next steps:
> * verify everything still works
> * fix remaining issues
> * final step: point the subdomain to the new gitlab pages URL
>
> If anybody else is interested in moving their wikis over, don't
> hesitate to ask me questions or just copy whatever I did :)

I did some further changes, like ensuring backwards compatibility to
existing links and already started to clean up some bits, like
removing the google translate stuff.

Now I'd like to get the subdomain changed of the current wiki over to
the gitlab stuff and wanted to ask for acks/nacks on this
