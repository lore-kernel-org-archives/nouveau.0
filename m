From: Patrice Mandin <mandin.patrice-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org>
Subject: Re: [PATCH] nouveau: avoid running out of relocs (attempt
 5)
Date: Sun, 13 Dec 2009 21:06:03 +0100
Message-ID: <20091213210603.9d0926f3.mandin.patrice@orange.fr>
References: <1260716857-6599-1-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1260716857-6599-1-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Le Sun, 13 Dec 2009 16:07:37 +0100
Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> a =E9crit:

> - Added flush notify functions for NV30 and NV40.
> - NV30 and NV40 need testing (check for regressions).

Just tested for NV30, no visible regression, just a minor performance
penalty. So it's OK for me.

Timedemo with ioquake3:

mesa git head:
1260 frames 31.5 seconds 40.0 fps 9.0/25.0/50.0/8.0 ms
1260 frames 31.4 seconds 40.1 fps 9.0/24.9/50.0/7.9 ms

with your patch, outofreloc.diff:
1260 frames 32.7 seconds 38.5 fps 9.0/26.0/52.0/8.2 ms
1260 frames 32.6 seconds 38.7 fps 9.0/25.8/51.0/8.1 ms

-- =

Patrice Mandin
WWW: http://pmandin.atari.org/
Programmeur Linux, Atari
Sp=E9cialit=E9: D=E9veloppement, jeux
