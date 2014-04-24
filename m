From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77529] [NVE7] NVS 510 DP-3 output doesn't work
Date: Thu, 24 Apr 2014 23:11:13 +0000
Message-ID: <bug-77529-8800-uD8qPB7Yt3@http.bugs.freedesktop.org/>
References: <bug-77529-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0162703965=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77529-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0162703965==
Content-Type: multipart/alternative; boundary="1398381073.a4aAD4Bb2.30297"; charset="us-ascii"


--1398381073.a4aAD4Bb2.30297
Date: Thu, 24 Apr 2014 23:11:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77529

--- Comment #12 from sergio <mailbox-JH6wT3sV7C4r+unkJK6bvw@public.gmane.org> ---
(In reply to comment #11)

> If they're different, perhaps it's because one is retrieved from PROM and the
> other from PRAMIN or something (as the VBIOS code doesn't copy it to PRAMIN
> if nothing's plugged in?)

You're right:

without monitors:
[    6.701295] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0e73d0a2
[    6.701366] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK107 (NVE7)
[    6.701429] nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
[    6.704392] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    6.704462] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    6.704526] nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
[    6.816794] nouveau  [   VBIOS][0000:01:00.0] ... checksum invalid
[    6.816857] nouveau  [   VBIOS][0000:01:00.0] checking ACPI for image...
[    6.816919] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    6.816981] nouveau  [   VBIOS][0000:01:00.0] checking PCIROM for image...
[    6.817051] nouveau 0000:01:00.0: Invalid ROM contents
[    6.818327] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    6.818392] nouveau  [   VBIOS][0000:01:00.0] using image from PCIROM
[    6.818642] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    6.818706] nouveau  [   VBIOS][0000:01:00.0] version 80.07.43.00.0d
[    6.818770] nouveau D[   VBIOS][0000:01:00.0] created



with DP-1:
[    6.654377] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0e73d0a2
[    6.654447] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK107 (NVE7)
[    6.654510] nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
[    6.657545] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    6.657624] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    6.657688] nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
[    6.769576] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    6.769640] nouveau  [   VBIOS][0000:01:00.0] using image from PROM
[    6.769894] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    6.769957] nouveau  [   VBIOS][0000:01:00.0] version 80.07.43.00.0d
[    6.770019] nouveau D[   VBIOS][0000:01:00.0] created



with DP-3: (Is this the begin of the problem?)
[    6.659517] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0e73d0a2
[    6.659587] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK107 (NVE7)
[    6.659650] nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
[    6.662670] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    6.662741] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    6.662804] nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
[    6.775445] nouveau  [   VBIOS][0000:01:00.0] ... checksum invalid
[    6.775510] nouveau  [   VBIOS][0000:01:00.0] checking ACPI for image...
[    6.775574] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    6.775637] nouveau  [   VBIOS][0000:01:00.0] checking PCIROM for image...
[    6.775709] nouveau 0000:01:00.0: Invalid ROM contents
[    6.777182] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    6.777248] nouveau  [   VBIOS][0000:01:00.0] using image from PCIROM
[    6.777498] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    6.777562] nouveau  [   VBIOS][0000:01:00.0] version 80.07.43.00.0d
[    6.777626] nouveau D[   VBIOS][0000:01:00.0] created

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1398381073.a4aAD4Bb2.30297
Date: Thu, 24 Apr 2014 23:11:13 +0000
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
   title="NEW --- - [NVE7] NVS 510 DP-3 output doesn't work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77529#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] NVS 510 DP-3 output doesn't work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77529">bug 77529</a>
              from <span class="vcard"><a class="email" href="mailto:mailbox&#64;sergio.spb.ru" title="sergio &lt;mailbox&#64;sergio.spb.ru&gt;"> <span class="fn">sergio</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=77529#c11">comment #11</a>)

<span class="quote">&gt; If they're different, perhaps it's because one is retrieved from PROM and the
&gt; other from PRAMIN or something (as the VBIOS code doesn't copy it to PRAMIN
&gt; if nothing's plugged in?)</span >

You're right:

without monitors:
[    6.701295] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0e73d0a2
[    6.701366] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK107 (NVE7)
[    6.701429] nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
[    6.704392] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    6.704462] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    6.704526] nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
[    6.816794] nouveau  [   VBIOS][0000:01:00.0] ... checksum invalid
[    6.816857] nouveau  [   VBIOS][0000:01:00.0] checking ACPI for image...
[    6.816919] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    6.816981] nouveau  [   VBIOS][0000:01:00.0] checking PCIROM for image...
[    6.817051] nouveau 0000:01:00.0: Invalid ROM contents
[    6.818327] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    6.818392] nouveau  [   VBIOS][0000:01:00.0] using image from PCIROM
[    6.818642] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    6.818706] nouveau  [   VBIOS][0000:01:00.0] version 80.07.43.00.0d
[    6.818770] nouveau D[   VBIOS][0000:01:00.0] created



with DP-1:
[    6.654377] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0e73d0a2
[    6.654447] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK107 (NVE7)
[    6.654510] nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
[    6.657545] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    6.657624] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    6.657688] nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
[    6.769576] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    6.769640] nouveau  [   VBIOS][0000:01:00.0] using image from PROM
[    6.769894] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    6.769957] nouveau  [   VBIOS][0000:01:00.0] version 80.07.43.00.0d
[    6.770019] nouveau D[   VBIOS][0000:01:00.0] created



with DP-3: (Is this the begin of the problem?)
[    6.659517] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0e73d0a2
[    6.659587] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK107 (NVE7)
[    6.659650] nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
[    6.662670] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    6.662741] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    6.662804] nouveau  [   VBIOS][0000:01:00.0] checking PROM for image...
[    6.775445] nouveau  [   VBIOS][0000:01:00.0] ... checksum invalid
[    6.775510] nouveau  [   VBIOS][0000:01:00.0] checking ACPI for image...
[    6.775574] nouveau  [   VBIOS][0000:01:00.0] ... signature not found
[    6.775637] nouveau  [   VBIOS][0000:01:00.0] checking PCIROM for image...
[    6.775709] nouveau 0000:01:00.0: Invalid ROM contents
[    6.777182] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    6.777248] nouveau  [   VBIOS][0000:01:00.0] using image from PCIROM
[    6.777498] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    6.777562] nouveau  [   VBIOS][0000:01:00.0] version 80.07.43.00.0d
[    6.777626] nouveau D[   VBIOS][0000:01:00.0] created</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1398381073.a4aAD4Bb2.30297--

--===============0162703965==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0162703965==--
