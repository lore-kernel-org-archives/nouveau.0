From: Anssi Hannula <anssi.hannula-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH r2] drm/nv04: fix null pointer dereferences
 of	native_mode
Date: Mon, 17 Aug 2009 07:11:21 +0300
Message-ID: <4A88D869.8070405@iki.fi>
References: <4A8840D7.5000409@iki.fi> <4A886130.5020005@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4A886130.5020005-X3B1VOXEql0@public.gmane.org>
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

Anssi Hannula wrote:
> In nv04_lvds_dpms and nv04_dfp_restore, refuse to turn on an LVDS panel
> if native mode is not known. While clock is not always required for
> turning panel on, having an LVDS without native mode means something went
> wrong already, so trying to turn panel on only in cases where clock is
> required would yield no added benefit.
  ^^^^^^^^
I meant "not required" :)

-- 
Anssi Hannula
