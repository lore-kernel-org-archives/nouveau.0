From: Delan Azabani <delan-Boohn7ZbvbpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: Can't use nouveau driver;
 /usr/lib/xorg/modules/drivers/nouveau_drv.so doesn't exist
Date: Wed, 03 Nov 2010 12:01:56 +0800
Message-ID: <4CD0DEB4.7070907@azabani.com>
References: <4CD0A1F4.7040703@azabani.com>
Reply-To: delan-Boohn7ZbvbpBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4CD0A1F4.7040703-Boohn7ZbvbpBDgjK7y7TUQ@public.gmane.org>
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

On 03/11/10 07:42, Delan Azabani wrote:
> Hi all,
> 
> I've compiled nouveau but am having trouble using it as the X driver.
> After installation, Xorg.0.log throws
> 
> [  3877.874] (II) LoadModule: "nouveau"
> [  3877.874] (WW) Warning, couldn't open module nouveau
> [  3877.874] (II) UnloadModule: "nouveau"
> [  3877.874] (EE) Failed to load module "nouveau" (module does not exist, 0)
> 
> Oddly, there is no nouveau_drv.so in /usr/lib/xorg/modules/drivers/ and
> I don't know where to find it.
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

Please ignore the replied email; it was a minor error on my part and is
not a bug. I've compiled it successfully and it works perfectly.
