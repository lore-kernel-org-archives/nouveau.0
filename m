From: Jimmy Rentz <jb17bsome-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: nv vpe video decoder
Date: Thu, 5 Aug 2010 22:36:18 -0400
Message-ID: <20100805223618.1cdcbb08@amd64linuxmsi.rentzhouse.lan>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hello,
	I have my work on the nv vpe video decoder in a functional
	state.  In case you didn't know this decoder accelerates mpeg2
	video at the idct/mc level.  I have verified that it works on
	nv40 hardware.  I believe it works on nv30 hardware (and
	maybe some earlier hardware), but I cannot verify since I have
	none. 
	I will reply with patches against the kernel, drm, ddx
	and mesa for your review.  Any comments are welcome.

	An important note is that the performance isn't that
	great in my opinion.  There is something preventing the nv vpe
	engine from rendering cmds at the same rate as the blob.  Either
	caching or whatever.    

Jimmy Rentz  

	
