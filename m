From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: updating the source tree
Date: Thu, 7 Oct 2010 20:51:45 +0300
Message-ID: <20101007205145.6dcf9178@daedalus.pq.iki.fi>
References: <4CAE04AB.9070202@pfu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4CAE04AB.9070202-t9zbU3WrWHI@public.gmane.org>
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

On Thu, 07 Oct 2010 19:34:35 +0200
Grzesiek S=F3jka <pld-t9zbU3WrWHI@public.gmane.org> wrote:

> Hi there,
> =

> I downloaded the nouveau/linux-2.6 using the following:
> git clone --depth 1
> git://anongit.freedesktop.org/nouveau/linux-2.6 Is there an easy
> way to update it to the current version (reversing all the
> changes I made) without downloading all the files again??

Yes, this should work:
http://nouveau.freedesktop.org/wiki/InstallDRM#UpdatingtheNouveaukernelgitr=
epository

That is, to fetch updates:
$ git remote update

and to reset your current checkout to nouveau/master:
$ git reset --hard origin/master

That should discard all commits and local changes you may have made.
It will not remove temporary files or compilation results.

-- =

Pekka Paalanen
http://www.iki.fi/pq/
