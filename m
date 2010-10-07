From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: updating the source tree
Date: Thu, 7 Oct 2010 21:55:05 +0300
Message-ID: <20101007215505.5dc21006@daedalus.pq.iki.fi>
References: <4CAE04AB.9070202@pfu.pl>
	<20101007205145.6dcf9178@daedalus.pq.iki.fi>
	<4CAE0C69.3040405@pfu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4CAE0C69.3040405-t9zbU3WrWHI@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Grzesiek =?ISO-8859-1?Q?S=F3jka?= <pld-t9zbU3WrWHI@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Thu, 07 Oct 2010 20:07:37 +0200
Grzesiek S=F3jka <pld-t9zbU3WrWHI@public.gmane.org> wrote:

> On 10/07/10 19:51, Pekka Paalanen wrote:
> > On Thu, 07 Oct 2010 19:34:35 +0200
> > Grzesiek S=F3jka<pld-t9zbU3WrWHI@public.gmane.org>  wrote:
> >
> >> I downloaded the nouveau/linux-2.6 using the following:
> >> git clone --depth 1
> >> git://anongit.freedesktop.org/nouveau/linux-2.6 Is there an

If you really did that
and then went into linux-2.6/ dir and said:

> # git remote update
> fatal: Not a git repository (or any parent up to mount
> parent /home) Stopping at filesystem boundary
> (GIT_DISCOVERY_ACROSS_FILESYSTEM not set).

I don't understand. Somehow you have deleted the .git/ directory
from that checkout. Or you have GIT_DIR environment variable set.

> This probably means that to be able to update I need to download
> the nouveau/linux-2.6 using the
> =

> git remote add nouveau
> git://anongit.freedesktop.org/nouveau/linux-2.6 git checkout -b
> nouveau-master nouveau/master

That works only if you already have a git repo. The previous error
says you don't have. Furthermore, the exact commands you quoted
do not actually download anything. You still need 'git remote update'
before checkout to download.

> instead of
> =

> git clone =

> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git

This will clone Linus' git repo, after which you would use the
'git remote add' incatation to add nouveau repo.

-- =

Pekka Paalanen
http://www.iki.fi/pq/
