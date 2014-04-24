From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77529] [NVE7] NVS 510 DP-3 output doesn't work
Date: Thu, 24 Apr 2014 20:48:22 +0000
Message-ID: <bug-77529-8800-WDtJwojfMC@http.bugs.freedesktop.org/>
References: <bug-77529-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1801755437=="
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


--===============1801755437==
Content-Type: multipart/alternative; boundary="1398372502.3a1B12.12611"; charset="us-ascii"


--1398372502.3a1B12.12611
Date: Thu, 24 Apr 2014 20:48:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77529

--- Comment #11 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
I haven't analyzed them, but vbios.rom should _not_ be a function of what's
plugged in. I sincerely hope that both of those files are the same. If they're
different, perhaps it's because one is retrieved from PROM and the other from
PRAMIN or something (as the VBIOS code doesn't copy it to PRAMIN if nothing's
plugged in?)

Looking at the dmesg's for DP1 vs DP3, a few observations:

DP1:
[    8.484516] nouveau D[   PDISP][0000:01:00.0] supervisor 00000001
[    8.484521] nouveau D[   PDISP][0000:01:00.0] head 0: 0x00011100
[    8.484524] nouveau D[   PDISP][0000:01:00.0] head 1: 0x00000000
[    8.484528] nouveau D[   PDISP][0000:01:00.0] head 2: 0x00000000
[    8.484532] nouveau D[   PDISP][0000:01:00.0] head 3: 0x00000000
[    8.484559] nouveau T[   VBIOS][0000:01:00.0] 0x5fe1[0]: DONE
[    8.516076] nouveau D[   PDISP][0000:01:00.0] supervisor 00000002
[    8.516080] nouveau D[   PDISP][0000:01:00.0] head 0: 0x00011100
[    8.516083] nouveau D[   PDISP][0000:01:00.0] head 1: 0x00000000
[    8.516087] nouveau D[   PDISP][0000:01:00.0] head 2: 0x00000000
[    8.516090] nouveau D[   PDISP][0000:01:00.0] head 3: 0x00000000
[    8.516114] nouveau T[   VBIOS][0000:01:00.0] 0x5fe2[0]: NV_REG   
R[0x80616600] &= 0xfffffffe |= 0x00000000
[    8.516118] nouveau T[   VBIOS][0000:01:00.0] 0x5fef[0]: DONE
[    8.516367] nouveau T[   VBIOS][0000:01:00.0] 0x5e15[0]: NV_REG   
R[0x00ea80] &= 0xfffffffd |= 0x00000002
[    8.516371] nouveau T[   VBIOS][0000:01:00.0] 0x5e22[0]: SUB_DIRECT   
0x5ff1

DP3:
[    8.487921] nouveau D[   PDISP][0000:01:00.0] supervisor 00000001
[    8.487925] nouveau D[   PDISP][0000:01:00.0] head 0: 0x00011100
[    8.487929] nouveau D[   PDISP][0000:01:00.0] head 1: 0x00000000
[    8.487933] nouveau D[   PDISP][0000:01:00.0] head 2: 0x00000000
[    8.487936] nouveau D[   PDISP][0000:01:00.0] head 3: 0x00000000
[    8.487958] nouveau T[   VBIOS][0000:01:00.0] 0x5fe1[0]: DONE
[    8.516202] nouveau D[   PDISP][0000:01:00.0] supervisor 00000002
[    8.516206] nouveau D[   PDISP][0000:01:00.0] head 0: 0x00011100
[    8.516210] nouveau D[   PDISP][0000:01:00.0] head 1: 0x00000000
[    8.516213] nouveau D[   PDISP][0000:01:00.0] head 2: 0x00000000
[    8.516217] nouveau D[   PDISP][0000:01:00.0] head 3: 0x00000000
[    8.516236] nouveau T[   VBIOS][0000:01:00.0] 0x5fe2[0]: NV_REG   
R[0x80616600] &= 0xfffffffe |= 0x00000000
[    8.516240] nouveau T[   VBIOS][0000:01:00.0] 0x5fef[0]: DONE
[    8.516482] nouveau T[   VBIOS][0000:01:00.0] 0x5b66[0]: SUB_DIRECT   
0x5ff1

Note that location 5b66 is executed for DP3 but 5e15 for DP1. Both sub to 5ff1,
but the DP1 one also writes to 0xea80 first. Haven't looked at why they call
out to different places, but can't think of a reason off-hand.

Then when training the link,

DP1:
[    8.518909] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: 2 lanes at
270000 KB/s
[    8.519095] nouveau T[   VBIOS][0000:01:00.0] 0x5d50[0]: ZM_REG   
R[0x4061c00c] = 0x01000300
[    8.519098] nouveau T[   VBIOS][0000:01:00.0] 0x5d59[0]: NV_REG   
R[0x4061c010] &= 0xff0fffff |= 0x00400000
[    8.519102] nouveau T[   VBIOS][0000:01:00.0] 0x5d66[0]: NV_REG   
R[0x4061c014] &= 0xffffffff |= 0x00000000
[    8.519106] nouveau T[   VBIOS][0000:01:00.0] 0x5d73[0]: DONE
[    8.519116] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: training pattern
1
[    8.519481] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: config lane 0 00
[    8.519495] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: config lane 1 00
[    8.520892] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: status 00 00 00
00 cc cc
[    8.520894] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: config lane 0 38
[    8.520912] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: config lane 1 38
[    8.522313] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: status 11 00 00
00 cc cc
[    8.522315] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: training pattern
2
[    8.523317] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: status 11 00 00
00 cc cc
[    8.523319] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: config lane 0 38
[    8.523336] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: config lane 1 38
[    8.525043] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: status 11 00 00
00 88 88
[    8.525045] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: config lane 0 10
[    8.525063] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: config lane 1 10
[    8.526763] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: status 11 00 00
00 44 44
[    8.526765] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: config lane 0 08
[    8.526780] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: config lane 1 08
[    8.528483] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: status 11 00 00
00 00 00
[    8.528485] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: config lane 0 00
[    8.528503] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: config lane 1 00
[    8.530279] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: status 11 00 00
00 44 44
[    8.530281] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: config lane 0 08
[    8.530296] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: config lane 1 08
[    8.531999] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: status 77 00 01
00 44 44
[    8.532007] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: config lane 0 08
[    8.532025] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: config lane 1 08
[    8.533096] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: training pattern
0

DP3:
[    8.519010] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: 2 lanes at
270000 KB/s
[    8.519196] nouveau T[   VBIOS][0000:01:00.0] 0x5b1a[0]: ZM_REG   
R[0x4061c00c] = 0x01000300
[    8.519199] nouveau T[   VBIOS][0000:01:00.0] 0x5b23[0]: NV_REG   
R[0x4061c010] &= 0xff0fffff |= 0x00400000
[    8.519203] nouveau T[   VBIOS][0000:01:00.0] 0x5b30[0]: NV_REG   
R[0x4061c014] &= 0xffffffff |= 0x00000000
[    8.519207] nouveau T[   VBIOS][0000:01:00.0] 0x5b3d[0]: DONE
[    8.519216] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: training pattern
1
[    8.519581] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: config lane 0 00
[    8.519595] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: config lane 1 00
[    8.520995] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: status 00 00 00
00 cc cc
[    8.520998] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: config lane 0 38
[    8.521014] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: config lane 1 38
[    8.522419] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: status 00 00 00
00 cc cc
[    8.522421] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: config lane 0 38
[    8.522438] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: config lane 1 38
[    8.523844] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: status 00 00 00
00 cc cc
[    8.523846] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: config lane 0 38
[    8.523862] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: config lane 1 38
[    8.525269] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: status 00 00 00
00 cc cc
[    8.525271] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: config lane 0 38
[    8.525287] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: config lane 1 38
[    8.526690] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: status 00 00 00
00 cc cc
[    8.526692] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: 2 lanes at
162000 KB/s
[    8.526885] nouveau T[   VBIOS][0000:01:00.0] 0x5b3e[0]: ZM_REG   
R[0x4061c00c] = 0x01000000
[    8.526888] nouveau T[   VBIOS][0000:01:00.0] 0x5b47[0]: NV_REG   
R[0x4061c010] &= 0xff0fffff |= 0x00300000
[    8.526893] nouveau T[   VBIOS][0000:01:00.0] 0x5b54[0]: NV_REG   
R[0x4061c014] &= 0xffffffff |= 0x00000000
[    8.526898] nouveau T[   VBIOS][0000:01:00.0] 0x5b61[0]: DONE
[    8.526908] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: training pattern
1
[    8.527283] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: config lane 0 00
[    8.527297] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: config lane 1 00
[    8.528700] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: status 00 00 00
00 cc cc
[    8.528702] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: config lane 0 38
[    8.528719] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: config lane 1 38
[    8.530122] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: status 00 00 00
00 cc cc
[    8.530124] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: config lane 0 38
[    8.530141] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: config lane 1 38
[    8.531548] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: status 00 00 00
00 cc cc
[    8.531550] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: config lane 0 38
[    8.531567] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: config lane 1 38
[    8.532970] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: status 00 00 00
00 cc cc
[    8.532972] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: config lane 0 38
[    8.532990] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: config lane 1 38
[    8.534392] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: status 00 00 00
00 cc cc
[    8.534394] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: training pattern
0

Which seems like a failure of some sort. The DP3 one falls back to 2x 162MHz
lanes, which also fails.

However it is still able to get the mode list from DP3. But I think that's done
via a side-channel.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1398372502.3a1B12.12611
Date: Thu, 24 Apr 2014 20:48:22 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77529#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] NVS 510 DP-3 output doesn't work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77529">bug 77529</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>I haven't analyzed them, but vbios.rom should _not_ be a function of what's
plugged in. I sincerely hope that both of those files are the same. If they're
different, perhaps it's because one is retrieved from PROM and the other from
PRAMIN or something (as the VBIOS code doesn't copy it to PRAMIN if nothing's
plugged in?)

Looking at the dmesg's for DP1 vs DP3, a few observations:

DP1:
[    8.484516] nouveau D[   PDISP][0000:01:00.0] supervisor 00000001
[    8.484521] nouveau D[   PDISP][0000:01:00.0] head 0: 0x00011100
[    8.484524] nouveau D[   PDISP][0000:01:00.0] head 1: 0x00000000
[    8.484528] nouveau D[   PDISP][0000:01:00.0] head 2: 0x00000000
[    8.484532] nouveau D[   PDISP][0000:01:00.0] head 3: 0x00000000
[    8.484559] nouveau T[   VBIOS][0000:01:00.0] 0x5fe1[0]: DONE
[    8.516076] nouveau D[   PDISP][0000:01:00.0] supervisor 00000002
[    8.516080] nouveau D[   PDISP][0000:01:00.0] head 0: 0x00011100
[    8.516083] nouveau D[   PDISP][0000:01:00.0] head 1: 0x00000000
[    8.516087] nouveau D[   PDISP][0000:01:00.0] head 2: 0x00000000
[    8.516090] nouveau D[   PDISP][0000:01:00.0] head 3: 0x00000000
[    8.516114] nouveau T[   VBIOS][0000:01:00.0] 0x5fe2[0]: NV_REG   
R[0x80616600] &amp;= 0xfffffffe |= 0x00000000
[    8.516118] nouveau T[   VBIOS][0000:01:00.0] 0x5fef[0]: DONE
[    8.516367] nouveau T[   VBIOS][0000:01:00.0] 0x5e15[0]: NV_REG   
R[0x00ea80] &amp;= 0xfffffffd |= 0x00000002
[    8.516371] nouveau T[   VBIOS][0000:01:00.0] 0x5e22[0]: SUB_DIRECT   
0x5ff1

DP3:
[    8.487921] nouveau D[   PDISP][0000:01:00.0] supervisor 00000001
[    8.487925] nouveau D[   PDISP][0000:01:00.0] head 0: 0x00011100
[    8.487929] nouveau D[   PDISP][0000:01:00.0] head 1: 0x00000000
[    8.487933] nouveau D[   PDISP][0000:01:00.0] head 2: 0x00000000
[    8.487936] nouveau D[   PDISP][0000:01:00.0] head 3: 0x00000000
[    8.487958] nouveau T[   VBIOS][0000:01:00.0] 0x5fe1[0]: DONE
[    8.516202] nouveau D[   PDISP][0000:01:00.0] supervisor 00000002
[    8.516206] nouveau D[   PDISP][0000:01:00.0] head 0: 0x00011100
[    8.516210] nouveau D[   PDISP][0000:01:00.0] head 1: 0x00000000
[    8.516213] nouveau D[   PDISP][0000:01:00.0] head 2: 0x00000000
[    8.516217] nouveau D[   PDISP][0000:01:00.0] head 3: 0x00000000
[    8.516236] nouveau T[   VBIOS][0000:01:00.0] 0x5fe2[0]: NV_REG   
R[0x80616600] &amp;= 0xfffffffe |= 0x00000000
[    8.516240] nouveau T[   VBIOS][0000:01:00.0] 0x5fef[0]: DONE
[    8.516482] nouveau T[   VBIOS][0000:01:00.0] 0x5b66[0]: SUB_DIRECT   
0x5ff1

Note that location 5b66 is executed for DP3 but 5e15 for DP1. Both sub to 5ff1,
but the DP1 one also writes to 0xea80 first. Haven't looked at why they call
out to different places, but can't think of a reason off-hand.

Then when training the link,

DP1:
[    8.518909] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: 2 lanes at
270000 KB/s
[    8.519095] nouveau T[   VBIOS][0000:01:00.0] 0x5d50[0]: ZM_REG   
R[0x4061c00c] = 0x01000300
[    8.519098] nouveau T[   VBIOS][0000:01:00.0] 0x5d59[0]: NV_REG   
R[0x4061c010] &amp;= 0xff0fffff |= 0x00400000
[    8.519102] nouveau T[   VBIOS][0000:01:00.0] 0x5d66[0]: NV_REG   
R[0x4061c014] &amp;= 0xffffffff |= 0x00000000
[    8.519106] nouveau T[   VBIOS][0000:01:00.0] 0x5d73[0]: DONE
[    8.519116] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: training pattern
1
[    8.519481] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: config lane 0 00
[    8.519495] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: config lane 1 00
[    8.520892] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: status 00 00 00
00 cc cc
[    8.520894] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: config lane 0 38
[    8.520912] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: config lane 1 38
[    8.522313] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: status 11 00 00
00 cc cc
[    8.522315] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: training pattern
2
[    8.523317] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: status 11 00 00
00 cc cc
[    8.523319] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: config lane 0 38
[    8.523336] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: config lane 1 38
[    8.525043] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: status 11 00 00
00 88 88
[    8.525045] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: config lane 0 10
[    8.525063] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: config lane 1 10
[    8.526763] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: status 11 00 00
00 44 44
[    8.526765] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: config lane 0 08
[    8.526780] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: config lane 1 08
[    8.528483] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: status 11 00 00
00 00 00
[    8.528485] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: config lane 0 00
[    8.528503] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: config lane 1 00
[    8.530279] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: status 11 00 00
00 44 44
[    8.530281] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: config lane 0 08
[    8.530296] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: config lane 1 08
[    8.531999] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: status 77 00 01
00 44 44
[    8.532007] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: config lane 0 08
[    8.532025] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: config lane 1 08
[    8.533096] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f44: training pattern
0

DP3:
[    8.519010] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: 2 lanes at
270000 KB/s
[    8.519196] nouveau T[   VBIOS][0000:01:00.0] 0x5b1a[0]: ZM_REG   
R[0x4061c00c] = 0x01000300
[    8.519199] nouveau T[   VBIOS][0000:01:00.0] 0x5b23[0]: NV_REG   
R[0x4061c010] &amp;= 0xff0fffff |= 0x00400000
[    8.519203] nouveau T[   VBIOS][0000:01:00.0] 0x5b30[0]: NV_REG   
R[0x4061c014] &amp;= 0xffffffff |= 0x00000000
[    8.519207] nouveau T[   VBIOS][0000:01:00.0] 0x5b3d[0]: DONE
[    8.519216] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: training pattern
1
[    8.519581] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: config lane 0 00
[    8.519595] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: config lane 1 00
[    8.520995] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: status 00 00 00
00 cc cc
[    8.520998] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: config lane 0 38
[    8.521014] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: config lane 1 38
[    8.522419] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: status 00 00 00
00 cc cc
[    8.522421] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: config lane 0 38
[    8.522438] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: config lane 1 38
[    8.523844] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: status 00 00 00
00 cc cc
[    8.523846] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: config lane 0 38
[    8.523862] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: config lane 1 38
[    8.525269] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: status 00 00 00
00 cc cc
[    8.525271] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: config lane 0 38
[    8.525287] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: config lane 1 38
[    8.526690] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: status 00 00 00
00 cc cc
[    8.526692] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: 2 lanes at
162000 KB/s
[    8.526885] nouveau T[   VBIOS][0000:01:00.0] 0x5b3e[0]: ZM_REG   
R[0x4061c00c] = 0x01000000
[    8.526888] nouveau T[   VBIOS][0000:01:00.0] 0x5b47[0]: NV_REG   
R[0x4061c010] &amp;= 0xff0fffff |= 0x00300000
[    8.526893] nouveau T[   VBIOS][0000:01:00.0] 0x5b54[0]: NV_REG   
R[0x4061c014] &amp;= 0xffffffff |= 0x00000000
[    8.526898] nouveau T[   VBIOS][0000:01:00.0] 0x5b61[0]: DONE
[    8.526908] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: training pattern
1
[    8.527283] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: config lane 0 00
[    8.527297] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: config lane 1 00
[    8.528700] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: status 00 00 00
00 cc cc
[    8.528702] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: config lane 0 38
[    8.528719] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: config lane 1 38
[    8.530122] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: status 00 00 00
00 cc cc
[    8.530124] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: config lane 0 38
[    8.530141] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: config lane 1 38
[    8.531548] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: status 00 00 00
00 cc cc
[    8.531550] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: config lane 0 38
[    8.531567] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: config lane 1 38
[    8.532970] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: status 00 00 00
00 cc cc
[    8.532972] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: config lane 0 38
[    8.532990] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: config lane 1 38
[    8.534392] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: status 00 00 00
00 cc cc
[    8.534394] nouveau D[   PDISP][0000:01:00.0] DP:0006:0f81: training pattern
0

Which seems like a failure of some sort. The DP3 one falls back to 2x 162MHz
lanes, which also fails.

However it is still able to get the mode list from DP3. But I think that's done
via a side-channel.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1398372502.3a1B12.12611--

--===============1801755437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1801755437==--
