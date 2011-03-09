From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 34508] [grub x86_64-efi] Macbook 5,
 2 - conflicting fb hw usage nouveaufb vs EFI VGA - removing generic
 driver
Date: Wed,  9 Mar 2011 08:56:46 -0800 (PST)
Message-ID: <20110309165646.7B18413000C@annarchy.freedesktop.org>
References: <bug-34508-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-34508-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=34508

--- Comment #2 from Gregory Bellier <dest-vb1CFJ/PVqUHz/9yF02f9g@public.gmane.org> 2011-03-09 08:56:45 PST ---
Ok, I confirm there is a problem with Nouveau. As soon as I installed the
Nvidia binary, I've been able to boot with refit + grub-efi_x86_64.

insmod efi_gop has to be added in the grub entry to be able to boot, like this
:

menuentry 'Linux without bios dump' {
        insmod efi_gop
        search --no-floppy --fs-uuid --set=root
d5175c18-7da2-49a9-a3af-844bad27c91d
        linux   /vmlinuz root=UUID=d5175c18-7da2-49a9-a3af-844bad27c91d ro
        initrd  /initrd.img
}

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
