From: Stefan Monnier <monnier-CRDzTM1onBSWkKpYnGOUKg@public.gmane.org>
Subject: Re: Kernel module indispensable?
Date: Thu, 02 Aug 2007 00:03:10 -0400
Message-ID: <jwvbqdq3845.fsf-monnier+inbox@gnu.org>
References: <jwvtzrj2kts.fsf-monnier+gmane.comp.freedesktop.xorg.nouveau@gnu.org>
	<6a89f9d50708011518o1bc1c8a5q83bb85fabf9d09d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6a89f9d50708011518o1bc1c8a5q83bb85fabf9d09d-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(Stephane Marchesin's message of "Thu\,
	2 Aug 2007 00\:18\:11 +0200")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Stephane Marchesin <marchesin-YynmYXH4S6491FlJP1ih0VAUjnlXr6A1@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

> The binary nvidia driver does require a kernel module as well.

Last time I used it (several months ago, admittedly), it didn't.  It did
come with one and needed it for DRI but worked otherwise correctly without
it.  Maybe newer releases have dropped this feature, I wouldn't know.

>> Stefan "whose kernel says `-1 Unknown symbol in module' when trying
>> to insert the new drm.ko module"

> That should be troubleshoot. Usually dmesg mentions missing symbols
> which in turn points at the real issue.

Indeed.  I just needed to insmod the agpgart module (I thought this list of
missing symbols was returned on stderr).

Good, on to the next problem...


        Stefan
