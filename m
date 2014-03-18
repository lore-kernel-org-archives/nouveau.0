From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH] pm/fan: drop the fan lock in fan_update()
	before rescheduling
Date: Tue, 18 Mar 2014 14:36:22 +0100
Message-ID: <53284BD6.7080700@free.fr>
References: <1394754503-22066-1-git-send-email-martin.peres@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1394754503-22066-1-git-send-email-martin.peres-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Le 14/03/2014 00:48, Martin Peres a =E9crit :
> From: Martin Peres <martin.peres-BktLLJ5BOkI@public.gmane.org>
>
> This should fix a deadlock that has been reported to us where fan_update()
> would hold the fan lock and try to grab the alarm_program_lock to resched=
ule
> an update. On an other CPU, the alarm_program_lock would have been taken
> before calling fan_update(), leading to a deadlock.
>
> Reported-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>

Tested-by: Timoth=E9e Ravier <tim-m/3gSgDDTkE@public.gmane.org>
Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # 3.9+

This problem dates back to fa37e8dda2617d48fbc6b17dd6e986e7f4c2bc8b. It =

would seem it got released in 3.9.
