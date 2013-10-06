From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70208] Nouveau driver doesn't find vbios for Geforce
 GT 750M on Asus N750JV laptop
Date: Sun, 06 Oct 2013 19:36:42 +0000
Message-ID: <bug-70208-8800-en98VLmn4l@http.bugs.freedesktop.org/>
References: <bug-70208-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0693616913=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70208-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0693616913==
Content-Type: multipart/alternative; boundary="1381088202.3BD8eBBD1.8333"; charset="us-ascii"


--1381088202.3BD8eBBD1.8333
Date: Sun, 6 Oct 2013 19:36:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70208

--- Comment #3 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
From the MMIO trace - the binary driver seems to be retrying in a very unusual
manner to retrieve the vbios from ACPI.
[mem 0x00000000c9e25000-0x00000000cab27fff] ACPI NVS


acpi_vbios() {
  W 0x088050 0x00000000 PPCI.ROM_SHADOW_ENABLE <= 0

  origin = 0xc9eca000;
  size = 0x1000;

  MAP $origin $size
  UNMAP

  base = origin;

  for (i = 0; i < ??; i++) {
    for (j = 0; j < 8; j++) {
      for (k = 1; k <= 8; k++) {
        MAP $base+(k*$size) $size
        UNMAP
      }
      MAP $base $size
      SLEEP 0.182000ms
      UNMAP
    }
    base += 8*$size;
  }
}

Not entirely sure if it succeeds though, but after this sequence it seems to be
doing all sorts of stupid stuff as init script tables do.
  R 0x000000 0x0e7240a2 PMC.ID
  W 0x000000 0x0e7240a2 
etc.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381088202.3BD8eBBD1.8333
Date: Sun, 6 Oct 2013 19:36:42 +0000
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
   title="NEW --- - Nouveau driver doesn't find vbios for Geforce GT 750M on Asus N750JV laptop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70208#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau driver doesn't find vbios for Geforce GT 750M on Asus N750JV laptop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70208">bug 70208</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>From the MMIO trace - the binary driver seems to be retrying in a very unusual
manner to retrieve the vbios from ACPI.
[mem 0x00000000c9e25000-0x00000000cab27fff] ACPI NVS


acpi_vbios() {
  W 0x088050 0x00000000 PPCI.ROM_SHADOW_ENABLE &lt;= 0

  origin = 0xc9eca000;
  size = 0x1000;

  MAP $origin $size
  UNMAP

  base = origin;

  for (i = 0; i &lt; ??; i++) {
    for (j = 0; j &lt; 8; j++) {
      for (k = 1; k &lt;= 8; k++) {
        MAP $base+(k*$size) $size
        UNMAP
      }
      MAP $base $size
      SLEEP 0.182000ms
      UNMAP
    }
    base += 8*$size;
  }
}

Not entirely sure if it succeeds though, but after this sequence it seems to be
doing all sorts of stupid stuff as init script tables do.
  R 0x000000 0x0e7240a2 PMC.ID
  W 0x000000 0x0e7240a2 
etc.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381088202.3BD8eBBD1.8333--

--===============0693616913==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0693616913==--
