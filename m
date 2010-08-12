From: Maxim Levitsky <maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [REGRESSION 2.6.35+] 3D is broken on GeForce 8400M (NV86)
Date: Thu, 12 Aug 2010 23:45:26 +0300
Message-ID: <1281645926.3893.33.camel@maxim-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hi,

nouveau drivers used to work flawlessly (well, very slow, and without
powermanagment, but otherwise very stable)

Now on git master, compiz freezes after few minutes, and no traces in
kernel log once that system was able to recover.
Note that I had this problem before yesterday pull of NV0C support.


Also the already slow 3D is even slower.
(It is theoretically possible that I have sw rendering, but I _only_
updated the kernel from 2.6.35)

I tested and 2.6.35 works flawlessly with nouveau
(I still don't use it, because even on idle GPU ends being 70C, and I
don't like that - will use nouveau when weather outside will permit
that. on nvidia temperature is about 10C lower, currently 61C).


Best regards,
Maxim Levitsky
