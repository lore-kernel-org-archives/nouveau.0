From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Testing nouveau on C51PV [GeForce 6150] (rev a2)
Date: Sun, 16 Sep 2012 16:54:48 +0200
Message-ID: <20120916145448.GA21927@joi.lan>
References: <5055C31D.9080109@web.de>
 <5055C53F.1020004@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5055C53F.1020004-S0/GAf8tV78@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Dietmar Kling <dietmar.kling-S0/GAf8tV78@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, Sep 16, 2012 at 02:25:35PM +0200, Dietmar Kling wrote:
> Dear all,
> 
> after having bad experiences with nouveau (using fedora 15,16,17) ,
> which resulted in an immediate lockup of my old server machine,
> i have given noveau another chance to run on a fedora kernel:
> 
> Linux version 3.5.3-1.fc17.x86_64 (mockbuild@)
> 
> 
> The good is news is - it doesn't lead to immediate lockup of the machine
> anymore.
> 
> The bad news. It still leads to a scrambled console screen, which does
> not contain any useful information.
> 
> It seems that there is an "INVALID_CMD" issued by the noveau driver.
> 
> Can anybody help me to resolve this problem?
> 
> 
> 
> The hopefully useful information i have compiled in the attachements
> 
> dmesg |grep nouveau >nouveau-grep.txt
> lspci |grep -i vga >vga-grep.txt
>    cat /proc/version >version-grep.txt

Please follow this guide: http://nouveau.freedesktop.org/wiki/Bugs
and open new bug report.

Marcin
