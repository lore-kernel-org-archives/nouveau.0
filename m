From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: Re: [Mesa3d-dev] [PATCH 2/2] st: don't assert on empty
	fragment program
Date: Mon, 18 Jan 2010 19:15:52 +0100
Message-ID: <ff13bc9a1001181015u4943a6edm4098145a12e72804@mail.gmail.com>
References: <1263764160-8891-1-git-send-email-luca@luca-barbieri.com>
	<1263764160-8891-2-git-send-email-luca@luca-barbieri.com>
	<4B54A208.10803@vmware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4B54A208.10803-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Brian Paul <brianp-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "mesa3d-dev-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <mesa3d-dev-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Breakpoint 3, _mesa_ProgramStringARB (target=34820, format=34933,
len=70, string=0x85922ba) at shader/arbprogram.c:434
434	   GET_CURRENT_CONTEXT(ctx);
$31 = 0x85922ba "!!ARBfp1.0\n    \n    OPTION
ARB_precision_hint_fastest;\n    \n\n\n    END\n"

Not sure why Sauerbraten does this, but it does, at least on my system
(Ubuntu Karmic, nv40 driver) and it should be legal.
