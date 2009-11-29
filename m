From: Reece Dunn <msclrhd-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: NVPutBlitImage has incorrect return type -- should be int,
	not Bool
Date: Sun, 29 Nov 2009 22:23:48 +0000
Message-ID: <3f4fd2640911291423g28b38093s3c6fe336e8d11513@mail.gmail.com>
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

Hi,

Looking at http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?id=5315034b7d46980a3527c814526857aed3bc98f7,
NVPutBlitImage was changed from a void return type to Bool return
type.

However, the return values are BadImplementation and Success, not TRUE
and FALSE. Therefore, the return type should not be Bool.

- Reece
