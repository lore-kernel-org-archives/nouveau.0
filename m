From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88868] New: PowerPC e5500, kernel crash, GT520, GT610
Date: Thu, 29 Jan 2015 15:06:00 +0000
Message-ID: <bug-88868-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0749400742=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0749400742==
Content-Type: multipart/alternative; boundary="1422543960.Cf451221.30623"; charset="UTF-8"


--1422543960.Cf451221.30623
Date: Thu, 29 Jan 2015 15:06:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=88868

            Bug ID: 88868
           Summary: PowerPC e5500, kernel crash, GT520, GT610
           Product: xorg
           Version: unspecified
          Hardware: PowerPC
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: oboturoff-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 112941
  --> https://bugs.freedesktop.org/attachment.cgi?id=112941&action=edit
kernel_log for GT610 with debug info

Hi,

We use devices on the base of PowerPC series e5500 and try to use the driver
nouveau. But by starting of nouveau driver we get kernel crash.

We used several kernels ver. 3.x but on all kernels we have same error. And try
to test several nvidia card GT520, GT610 and other.


I tryed to solve the problem by myself and added some debug codes:
1. I added the following debug codes into the file base.c
        /* read boot0 and strapping information */
        boot0 = ioread32_native(map + 0x000000);
        strap = ioread32_native(map + 0x101000);

        iounmap(map);

        printk ("##boot0=%x\n",boot0);
        printk ("##strap=%x\n",strap);

The result you can see in the log_gt610 attachment file. The value of the
variable "boot0" for this video card is to be of the value 0x0d90a0a1, in the
log it is value in the reverse order. The value of the variable "strap" is to
be of the value 0x80406892, in the log it isn't reversed but there is no msd.
What does the fact depend on that 2 registers are readed and one of them is
reversed, but the other are not in the same time?

2. kernel crash happens by running of the code from the file base.c
    if (nv_rd08(bios, 0x700000) != 0x55 ||
        nv_rd08(bios, 0x700001) != 0xaa) {

It means that the address reading of 0x700000 results the kernel crash. Why
does it happen? The result of the address reading of 0x619f04 is shown for the
information.

static void
nouveau_bios_shadow_pramin(struct nouveau_bios *bios)
{
    struct nouveau_device *device = nv_device(bios);
    u32 bar0 = 0;
    int i;
    unsigned int tmp_val;

    if (device->card_type >= NV_50) {
        u64 addr = (u64)(nv_rd32(bios, 0x619f04) & 0xffffff00) << 8;
        if (!addr) {
            addr  = (u64)nv_rd32(bios, 0x001700) << 16;
            addr += 0xf0000;
        }

        bar0 = nv_mask(bios, 0x001700, 0xffffffff, addr >> 16);
    }

    tmp_val = nv_rd32(bios, 0x619f04);
    printk ("##val=%x\n", tmp_val);

 In the log we can see the variable value of tmp_val. It is evident that it
isn't correct too. Why is the address 0x619f04 not readed correctly and what
happens with kernel crash by reading of the addresses of 0x700000 and of
0x700001.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1422543960.Cf451221.30623
Date: Thu, 29 Jan 2015 15:06:00 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - PowerPC e5500, kernel crash, GT520, GT610"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88868">88868</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>PowerPC e5500, kernel crash, GT520, GT610
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>PowerPC
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>oboturoff&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=112941" name="attach_112941" title="kernel_log for GT610 with debug info">attachment 112941</a> <a href="attachment.cgi?id=112941&amp;action=edit" title="kernel_log for GT610 with debug info">[details]</a></span>
kernel_log for GT610 with debug info

Hi,

We use devices on the base of PowerPC series e5500 and try to use the driver
nouveau. But by starting of nouveau driver we get kernel crash.

We used several kernels ver. 3.x but on all kernels we have same error. And try
to test several nvidia card GT520, GT610 and other.


I tryed to solve the problem by myself and added some debug codes:
1. I added the following debug codes into the file base.c
        /* read boot0 and strapping information */
        boot0 = ioread32_native(map + 0x000000);
        strap = ioread32_native(map + 0x101000);

        iounmap(map);

        printk (&quot;##boot0=%x\n&quot;,boot0);
        printk (&quot;##strap=%x\n&quot;,strap);

The result you can see in the log_gt610 attachment file. The value of the
variable &quot;boot0&quot; for this video card is to be of the value 0x0d90a0a1, in the
log it is value in the reverse order. The value of the variable &quot;strap&quot; is to
be of the value 0x80406892, in the log it isn't reversed but there is no msd.
What does the fact depend on that 2 registers are readed and one of them is
reversed, but the other are not in the same time?

2. kernel crash happens by running of the code from the file base.c
    if (nv_rd08(bios, 0x700000) != 0x55 ||
        nv_rd08(bios, 0x700001) != 0xaa) {

It means that the address reading of 0x700000 results the kernel crash. Why
does it happen? The result of the address reading of 0x619f04 is shown for the
information.

static void
nouveau_bios_shadow_pramin(struct nouveau_bios *bios)
{
    struct nouveau_device *device = nv_device(bios);
    u32 bar0 = 0;
    int i;
    unsigned int tmp_val;

    if (device-&gt;card_type &gt;= NV_50) {
        u64 addr = (u64)(nv_rd32(bios, 0x619f04) &amp; 0xffffff00) &lt;&lt; 8;
        if (!addr) {
            addr  = (u64)nv_rd32(bios, 0x001700) &lt;&lt; 16;
            addr += 0xf0000;
        }

        bar0 = nv_mask(bios, 0x001700, 0xffffffff, addr &gt;&gt; 16);
    }

    tmp_val = nv_rd32(bios, 0x619f04);
    printk (&quot;##val=%x\n&quot;, tmp_val);

 In the log we can see the variable value of tmp_val. It is evident that it
isn't correct too. Why is the address 0x619f04 not readed correctly and what
happens with kernel crash by reading of the addresses of 0x700000 and of
0x700001.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1422543960.Cf451221.30623--

--===============0749400742==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0749400742==--
