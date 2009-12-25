From: Anssi Hannula <anssi-4qZELD6Fgxhg9hUCZPvPmw@public.gmane.org>
Subject: Nouveau now used as the default free driver on Mandriva
	Linux
Date: Fri, 25 Dec 2009 23:20:35 +0200
Message-ID: <4B352CA3.4090100@mandriva.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

Hi all,

This is mostly an FYI post that as of yesterday, nouveau is now used as
the default free NVIDIA driver, in place of nv, on Mandriva Cooker (the
development version of our distribution). [1]
We still default to the proprietary driver when it is available and the
user doesn't decline.

We'll try to make sure any bugreports we get are first confirmed with
nouveau git before forwarding them to you.

We introduced Nouveau as an optional driver exactly two years ago, and
for the previous release we added the module to our regular kernels
(e.g. 2010.0 One live images can be booted with nouveau with
xdriver=nouveau parameter).

[1] http://lists.mandriva.com/cooker/2009-12/msg00769.php

-- 
Anssi Hannula
Mandriva package maintainer of nouveau and proprietary nvidia+fglrx
