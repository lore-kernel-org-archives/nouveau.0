From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 46557] nouveau: NV4E acceleration corruption when
 DMA about 31-bit (2 G)
Date: Sun, 17 Jun 2012 20:12:54 +0000
Message-ID: <bug-46557-8800-enL9Wzx2Dm@http.bugs.freedesktop.org/>
References: <bug-46557-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-46557-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=46557

--- Comment #17 from Salah Coronya <salah.coronya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2012-06-17 13:12:54 PDT ---
The above "workaround" works. Framebuffer is OK, X is good, glxgears runs
without having to specify mem=2G (this is against the nouveau git).

I think it is buggy hardware - its just the blob and Windows driver know about
it and only do 31-bit DMA (or maybe they just get lucky). Attempting to set
dma_bits=31 in nouveau_vram_init cause nouveau_sgdma_init to mail to map the
page, and attempting to allocate a suitable page using pci_alloc_consistent /
dna_alloc_coherent or alloc_page GFP_DMA flag causes BUGs and paging faults.  

If I specify if I specify both nouveau.vram_pushbuf=1 AND nouveau.vram_notify=1
(just one alone does not work), it "soft of" works without mem=2G. The
framebuffer is OK. X is still distorted but not as badly and isn't locked up,
and the dmesg is no longer filled with errors, but glxgears does not work (it
doesn't crash but just shows crazy flashing triangles).

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
