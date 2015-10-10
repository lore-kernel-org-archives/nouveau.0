From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92377] New: Add support for early voltage table as
	seen on nv43
Date: Sat, 10 Oct 2015 05:07:52 +0000
Message-ID: <bug-92377-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0548912045=="
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


--===============0548912045==
Content-Type: multipart/alternative; boundary="1444453672.A28BFEC71.19905"; charset="UTF-8"


--1444453672.A28BFEC71.19905
Date: Sat, 10 Oct 2015 05:07:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92377

            Bug ID: 92377
           Summary: Add support for early voltage table as seen on nv43
           Product: xorg
           Version: git
          Hardware: x86 (IA32)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: randrik-JGs/UdohzUI@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 118791
  --> https://bugs.freedesktop.org/attachment.cgi?id=118791&action=edit
vbios as extracted by envytools

Latest nouveau (after 4.2) started to refuse to change clocks on my nv43 board.
Investigation showed it was simply failing to find voltage table, while such
table was recognized by nvbios tool from envytools.

So, I've added patch along those lines:



    diff --git a/drm/nouveau/nvkm/subdev/bios/volt.c
b/drm/nouveau/nvkm/subdev/bios/volt.c
    index 6e0a336..3e9dafa 100644
    --- a/drm/nouveau/nvkm/subdev/bios/volt.c
    +++ b/drm/nouveau/nvkm/subdev/bios/volt.c
    @@ -40,8 +40,10 @@ nvbios_volt_table(struct nvkm_bios *bios, u8 *ver, u8
*hdr, u8 *cnt, u8 *len)

                    if (volt) {
                            *ver = nvbios_rd08(bios, volt + 0);
    +                       printk ("nvbios_volt_table_Ver, %d\n", *ver);
                            switch (*ver) {
                            case 0x12:
    +                       case 0x10:
                                    *hdr = 5;
                                    *cnt = nvbios_rd08(bios, volt + 2);
                                    *len = nvbios_rd08(bios, volt + 1);
    @@ -71,8 +73,11 @@ nvbios_volt_parse(struct nvkm_bios *bios, u8 *ver, u8
*hdr, u8 *cnt, u8 *len,
     {
            u16 volt = nvbios_volt_table(bios, ver, hdr, cnt, len);
            memset(info, 0x00, sizeof(*info));
    +       printk("nvbios_volt_parse called!\n");
    +       printk("volt_table_Version: %d\n", !!volt * *ver);
            switch (!!volt * *ver) {
            case 0x12:
    +       case 0x10:
                    info->type    = NVBIOS_VOLT_GPIO;
                    info->vidmask = nvbios_rd08(bios, volt + 0x04);
                    break;
    @@ -131,8 +136,10 @@ nvbios_volt_entry_parse(struct nvkm_bios *bios, int
idx, u8 *ver, u8 *len,
     {
            u16 volt = nvbios_volt_entry(bios, idx, ver, len);
            memset(info, 0x00, sizeof(*info));
    +       printk("nvbios_volt_entry_parse called!\n");
            switch (!!volt * *ver) {
            case 0x12:
    +       case 0x10:
            case 0x20:
                    info->voltage = nvbios_rd08(bios, volt + 0x00) * 10000;
                    info->vid     = nvbios_rd08(bios, volt + 0x01);


and it seems to work.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1444453672.A28BFEC71.19905
Date: Sat, 10 Oct 2015 05:07:52 +0000
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
   title="NEW - Add support for early voltage table as seen on nv43"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92377">92377</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Add support for early voltage table as seen on nv43
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86 (IA32)
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
          <td>randrik&#64;mail.ru
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=118791" name="attach_118791" title="vbios as extracted by envytools">attachment 118791</a> <a href="attachment.cgi?id=118791&amp;action=edit" title="vbios as extracted by envytools">[details]</a></span>
vbios as extracted by envytools

Latest nouveau (after 4.2) started to refuse to change clocks on my nv43 board.
Investigation showed it was simply failing to find voltage table, while such
table was recognized by nvbios tool from envytools.

So, I've added patch along those lines:



    diff --git a/drm/nouveau/nvkm/subdev/bios/volt.c
b/drm/nouveau/nvkm/subdev/bios/volt.c
    index 6e0a336..3e9dafa 100644
    --- a/drm/nouveau/nvkm/subdev/bios/volt.c
    +++ b/drm/nouveau/nvkm/subdev/bios/volt.c
    &#64;&#64; -40,8 +40,10 &#64;&#64; nvbios_volt_table(struct nvkm_bios *bios, u8 *ver, u8
*hdr, u8 *cnt, u8 *len)

                    if (volt) {
                            *ver = nvbios_rd08(bios, volt + 0);
    +                       printk (&quot;nvbios_volt_table_Ver, %d\n&quot;, *ver);
                            switch (*ver) {
                            case 0x12:
    +                       case 0x10:
                                    *hdr = 5;
                                    *cnt = nvbios_rd08(bios, volt + 2);
                                    *len = nvbios_rd08(bios, volt + 1);
    &#64;&#64; -71,8 +73,11 &#64;&#64; nvbios_volt_parse(struct nvkm_bios *bios, u8 *ver, u8
*hdr, u8 *cnt, u8 *len,
     {
            u16 volt = nvbios_volt_table(bios, ver, hdr, cnt, len);
            memset(info, 0x00, sizeof(*info));
    +       printk(&quot;nvbios_volt_parse called!\n&quot;);
    +       printk(&quot;volt_table_Version: %d\n&quot;, !!volt * *ver);
            switch (!!volt * *ver) {
            case 0x12:
    +       case 0x10:
                    info-&gt;type    = NVBIOS_VOLT_GPIO;
                    info-&gt;vidmask = nvbios_rd08(bios, volt + 0x04);
                    break;
    &#64;&#64; -131,8 +136,10 &#64;&#64; nvbios_volt_entry_parse(struct nvkm_bios *bios, int
idx, u8 *ver, u8 *len,
     {
            u16 volt = nvbios_volt_entry(bios, idx, ver, len);
            memset(info, 0x00, sizeof(*info));
    +       printk(&quot;nvbios_volt_entry_parse called!\n&quot;);
            switch (!!volt * *ver) {
            case 0x12:
    +       case 0x10:
            case 0x20:
                    info-&gt;voltage = nvbios_rd08(bios, volt + 0x00) * 10000;
                    info-&gt;vid     = nvbios_rd08(bios, volt + 0x01);


and it seems to work.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1444453672.A28BFEC71.19905--

--===============0548912045==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0548912045==--
