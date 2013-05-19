From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64774] nouveau GF108 kernel crash in optimus mode
 when enabling external display output
Date: Sun, 19 May 2013 21:42:34 +0000
Message-ID: <bug-64774-8800-rpuxYkhYnY@http.bugs.freedesktop.org/>
References: <bug-64774-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1443346699=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-64774-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1443346699==
Content-Type: multipart/alternative; boundary="1368999754.22feea61.10807"; charset="us-ascii"


--1368999754.22feea61.10807
Date: Sun, 19 May 2013 21:42:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=64774

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Well, +0x8e is +142, and we see

   0x0000000000023bae <+142>:    mov    (%rcx,%r13,1),%rax
   0x0000000000023bb2 <+146>:    shr    $0x8,%rax
   0x0000000000023bb6 <+150>:    mov    %rax,%rdx
   0x0000000000023bb9 <+153>:    or     $0x3,%rax
   0x0000000000023bbd <+157>:    or     $0x1,%rdx

which I'm fairly sure corresponds to

        u64 phys = nvc0_vm_addr(vma, *list++, memtype, target);

Since

static inline u64
nvc0_vm_addr(struct nouveau_vma *vma, u64 phys, u32 memtype, u32 target)
{
    phys >>= 8;
    phys |= 0x00000001; /* present */
    if (vma->access & NV_MEM_ACCESS_SYS)
        phys |= 0x00000002;

(And for some reason it splits the two branches into two separate registers...
odd, but nothing else in the code matches up as nicely.)

So that means that the passed in list pointer must be null. This corresponds to

drivers/gpu/drm/nouveau/nouveau_bo.c:nouveau_vma_getmap which passes in
mem->mm_node as the mem argument to vm_map_sg, which in turn does mem->pages.

So perhaps add something to the top of nouveau_vma_getmap (before the vm_get
call) like

if (WARN_ON(!node->pages)) {
  return -EINVAL;
}

Which should help avoid the crash, but will not provide any additional
functionality. You should then see a backtrace, but no crash.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1368999754.22feea61.10807
Date: Sun, 19 May 2013 21:42:34 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau GF108 kernel crash in optimus mode when enabling external display output"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64774#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau GF108 kernel crash in optimus mode when enabling external display output"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64774">bug 64774</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Well, +0x8e is +142, and we see

   0x0000000000023bae &lt;+142&gt;:    mov    (%rcx,%r13,1),%rax
   0x0000000000023bb2 &lt;+146&gt;:    shr    $0x8,%rax
   0x0000000000023bb6 &lt;+150&gt;:    mov    %rax,%rdx
   0x0000000000023bb9 &lt;+153&gt;:    or     $0x3,%rax
   0x0000000000023bbd &lt;+157&gt;:    or     $0x1,%rdx

which I'm fairly sure corresponds to

        u64 phys = nvc0_vm_addr(vma, *list++, memtype, target);

Since

static inline u64
nvc0_vm_addr(struct nouveau_vma *vma, u64 phys, u32 memtype, u32 target)
{
    phys &gt;&gt;= 8;
    phys |= 0x00000001; /* present */
    if (vma-&gt;access &amp; NV_MEM_ACCESS_SYS)
        phys |= 0x00000002;

(And for some reason it splits the two branches into two separate registers...
odd, but nothing else in the code matches up as nicely.)

So that means that the passed in list pointer must be null. This corresponds to

drivers/gpu/drm/nouveau/nouveau_bo.c:nouveau_vma_getmap which passes in
mem-&gt;mm_node as the mem argument to vm_map_sg, which in turn does mem-&gt;pages.

So perhaps add something to the top of nouveau_vma_getmap (before the vm_get
call) like

if (WARN_ON(!node-&gt;pages)) {
  return -EINVAL;
}

Which should help avoid the crash, but will not provide any additional
functionality. You should then see a backtrace, but no crash.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1368999754.22feea61.10807--

--===============1443346699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1443346699==--
