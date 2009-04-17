From: jb17bsome <jedynamic-Bdlq13kUjeyLZ21kGMrzwg@public.gmane.org>
Subject: NV40 Cubic Texture HW Mip Map Generation
Date: Fri, 17 Apr 2009 01:59:04 -0400
Message-ID: <20090417015904.6c4b9d20@amd64linuxmsi.rentzhouse.lan>
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

Hello,
	I have been looking at cubic texture mapping for a bit, and I
	have found that hw mipmap generation doesn't work at all or
	the textures are all messed up (normal 2d work fine). This is
	with linear textures.  Also of note is that software mipmap
	generation works fine.

	I have done sanity checks for the miptree pitches, offsets, etc
	and everything seems to match up fine for both the hw and sw
	paths.  

	Any thoughts on what could be wrong?

jb17bsome	   
