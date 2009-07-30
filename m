From: "provider.spb-JGs/UdohzUI@public.gmane.org" <provider.spb-JGs/UdohzUI@public.gmane.org>
Subject: nv50: laptop screen goes from black to white
Date: Thu, 30 Jul 2009 12:32:19 +0400
Message-ID: <4A715A93.4060500@mail.ru>
References: <bug-22179-8800@http.bugs.freedesktop.org/>
	<20090729151047.309BC13005B@annarchy.freedesktop.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20090729151047.309BC13005B-4GnqB8vgsbnwRzGw0Gvu8Q/tdpCO6/zZ@public.gmane.org>
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

I have same issue with GF 8600M GS (G86) on my laptop - black screen 
with KMS enabled, sometimes with colorful lines, somteimes slowly turns 
to white. When i connect external LCD monitor, there is pretty image on 
it, all works, but laptop internal screen still not work. Fixed by 
adding uscript_lvds=1 to kernel command line. And now i have problems 
only with EXAPixmaps option - few 2D corruptions and lockups about 15-20 
seconds.
P.S. Thank you all! It's greatest work!
-------------------------------------
Dmitriy Vasin
Gigzbyte Security Group
