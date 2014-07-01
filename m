From: Sven Joachim <svenjoac-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: nouveau xorg driver - compile error
Date: Tue, 01 Jul 2014 23:12:36 +0200
Message-ID: <87pphozsu3.fsf@turtle.gmx.de>
References: <201407012147.46585@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <201407012147.46585@pali> ("Pali =?iso-8859-1?Q?Roh=E1r=22's?=
 message of "Tue, 1 Jul 2014 21:47:46 +0200")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <public-pali.rohar-Re5JQEeQqe8AvxtiuMwx3w-wOFGN7rlS/M9smdsby/KFg@public.gmane.org>
Cc: public-nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW-wOFGN7rlS/M9smdsby/KFg@public.gmane.org
List-Id: nouveau.vger.kernel.org



On 2014-07-01 21:47 +0200, Pali Roh=E1r wrote:

> Hello,
>
> nouveau xorg driver from master git repository cannot be compiled
> on ubuntu precise. Here is build log:
>
> https://launchpadlibrarian.net/179062836/buildlog_ubuntu-precise-amd64.xs=
erver-xorg-video-nouveau_1:1.0.10-git201407010817~ubuntu12.04.1_FAILEDTOBUI=
LD.txt.gz
>
> Problem is somewhere in drmmode_display.c. Can somebody look at
> it and fix compile error problems?

Don't know how best to fix it, but the problem is that xorg_list only
exists in X server 1.12 and later, Ubuntu precise has 1.11.

Cheers,
       Sven
