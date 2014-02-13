From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67628] [NVC1] [BISECTED] Monitor on Display port
 shows distortions
Date: Thu, 13 Feb 2014 04:34:08 +0000
Message-ID: <bug-67628-8800-JqHJwPRDty@http.bugs.freedesktop.org/>
References: <bug-67628-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1027472124=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67628-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1027472124==
Content-Type: multipart/alternative; boundary="1392266048.28fdfef83.11050"; charset="us-ascii"


--1392266048.28fdfef83.11050
Date: Thu, 13 Feb 2014 04:34:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67628

--- Comment #18 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Looking at the earlier vbios execution logs:

working:

[    5.517869] nouveau D[   PDISP][0000:01:00.0] supervisor 0x00000010
0x000002a0
[    5.517885] nouveau T[   VBIOS][0000:01:00.0] 0x568f[0]: DONE
[    5.539255] nouveau D[   PDISP][0000:01:00.0] supervisor 0x00000020
0x000002b0
[    5.539272] nouveau T[   VBIOS][0000:01:00.0] 0x5690[0]: NV_REG   
R[0x4061c00c] &= 0xfffffffe |= 0x00000001
[    5.539276] nouveau T[   VBIOS][0000:01:00.0] 0x569d[0]: NV_REG   
R[0x4061c014] &= 0xff3fffff |= 0x00c00000
[    5.539279] nouveau T[   VBIOS][0000:01:00.0] 0x56aa[0]: DONE
[    5.539332] nouveau D[   PDISP][0000:01:00.0] supervisor 0x00000040
0x000002b0

non-working:

[    1.679797] nouveau D[   PDISP][0000:01:00.0] supervisor 0x00000010
0x000002a0
[    1.679816] nouveau T[   VBIOS][0000:01:00.0] 0x568f[0]: DONE
[    1.707114] nouveau D[   PDISP][0000:01:00.0] supervisor 0x00000020
0x000002b0
[    1.707128] nouveau T[   VBIOS][0000:01:00.0] 0x5690[0]: NV_REG   
R[0x4061c00c] &= 0xfffffffe |= 0x00000001
[    1.707133] nouveau T[   VBIOS][0000:01:00.0] 0x569d[0]: NV_REG   
R[0x4061c014] &= 0xff3fffff |= 0x00c00000
[    1.707136] nouveau T[   VBIOS][0000:01:00.0] 0x56aa[0]: DONE
[    1.707162] nouveau T[   VBIOS][0000:01:00.0] 0x53c8[0]: ZM_REG_SEQUENCE   
0x04
[    1.707163] nouveau T[   VBIOS][0000:01:00.0] 0x53ce[0]:         R[0x61c00c]
= 0x01000000
[    1.707164] nouveau T[   VBIOS][0000:01:00.0] 0x53d2[0]:         R[0x61c010]
= 0x00101500
[    1.707165] nouveau T[   VBIOS][0000:01:00.0] 0x53d6[0]:         R[0x61c014]
= 0x00000000
[    1.707166] nouveau T[   VBIOS][0000:01:00.0] 0x53da[0]:         R[0x61c018]
= 0x00245af8
[    1.707166] nouveau T[   VBIOS][0000:01:00.0] 0x53de[0]: ZM_REG_SEQUENCE   
0x02
[    1.707167] nouveau T[   VBIOS][0000:01:00.0] 0x53e4[0]:         R[0x61c118]
= 0x27272727
[    1.707168] nouveau T[   VBIOS][0000:01:00.0] 0x53e8[0]:         R[0x61c11c]
= 0x00000027
[    1.707169] nouveau T[   VBIOS][0000:01:00.0] 0x53ec[0]: ZM_REG_SEQUENCE   
0x02
[    1.707169] nouveau T[   VBIOS][0000:01:00.0] 0x53f2[0]:         R[0x61c198]
= 0x27272727
[    1.707170] nouveau T[   VBIOS][0000:01:00.0] 0x53f6[0]:         R[0x61c19c]
= 0x00000027
[    1.707171] nouveau T[   VBIOS][0000:01:00.0] 0x53fa[0]: NV_REG   
R[0x61c120] &= 0xffffffff |= 0x00000000
[    1.707175] nouveau T[   VBIOS][0000:01:00.0] 0x5407[0]: NV_REG   
R[0x61c1a0] &= 0xffffffff |= 0x00000000
[    1.707178] nouveau T[   VBIOS][0000:01:00.0] 0x5414[0]: SUB_DIRECT   
0x5cb0
[    1.707179] nouveau T[   VBIOS][0000:01:00.0] 0x5cb0[1]: DONE
[    1.707180] nouveau T[   VBIOS][0000:01:00.0] 0x5417[0]: SUB_DIRECT   
0x546e
[    1.707180] nouveau T[   VBIOS][0000:01:00.0] 0x546e[1]: SUB_DIRECT   
0x4f5c
[    1.707181] nouveau T[   VBIOS][0000:01:00.0] 0x4f5c[2]: SUB_DIRECT   
0x56ab
[    1.707182] nouveau T[   VBIOS][0000:01:00.0] 0x56ab[3]: ZM_REG_SEQUENCE   
0x10
[    1.707183] nouveau T[   VBIOS][0000:01:00.0] 0x56b1[3]:        
R[0x4061c040] = 0x1f0b0000
[    1.707184] nouveau T[   VBIOS][0000:01:00.0] 0x56b5[3]:        
R[0x4061c044] = 0x1f0a0000
[    1.707184] nouveau T[   VBIOS][0000:01:00.0] 0x56b9[3]:        
R[0x4061c048] = 0x1e080000
[    1.707185] nouveau T[   VBIOS][0000:01:00.0] 0x56bd[3]:        
R[0x4061c04c] = 0x1e042000
[    1.707186] nouveau T[   VBIOS][0000:01:00.0] 0x56c1[3]:        
R[0x4061c050] = 0x00008000
[    1.707187] nouveau T[   VBIOS][0000:01:00.0] 0x56c5[3]:        
R[0x4061c054] = 0x00008000
[    1.707188] nouveau T[   VBIOS][0000:01:00.0] 0x56c9[3]:        
R[0x4061c058] = 0x00008000
[    1.707188] nouveau T[   VBIOS][0000:01:00.0] 0x56cd[3]:        
R[0x4061c05c] = 0x00008000
[    1.707189] nouveau T[   VBIOS][0000:01:00.0] 0x56d1[3]:        
R[0x4061c060] = 0x00002000
[    1.707190] nouveau T[   VBIOS][0000:01:00.0] 0x56d5[3]:        
R[0x4061c064] = 0x1f002000
[    1.707191] nouveau T[   VBIOS][0000:01:00.0] 0x56d9[3]:        
R[0x4061c068] = 0x1f0c0000
[    1.707191] nouveau T[   VBIOS][0000:01:00.0] 0x56dd[3]:        
R[0x4061c06c] = 0x1f0a0000
[    1.707192] nouveau T[   VBIOS][0000:01:00.0] 0x56e1[3]:        
R[0x4061c070] = 0x1f0b8000
[    1.707193] nouveau T[   VBIOS][0000:01:00.0] 0x56e5[3]:        
R[0x4061c074] = 0x1f0b8000
[    1.707194] nouveau T[   VBIOS][0000:01:00.0] 0x56e9[3]:        
R[0x4061c078] = 0x1f0b8000
[    1.707195] nouveau T[   VBIOS][0000:01:00.0] 0x56ed[3]:        
R[0x4061c07c] = 0x1f0b8000
[    1.707195] nouveau T[   VBIOS][0000:01:00.0] 0x56f1[3]: DONE
[    1.707196] nouveau T[   VBIOS][0000:01:00.0] 0x4f5f[2]: NV_REG   
R[0x4061c130] &= 0xffbf00ff |= 0x00400600
[    1.707201] nouveau T[   VBIOS][0000:01:00.0] 0x4f6c[2]: NV_REG   
R[0x4061c1b0] &= 0xffbf00ff |= 0x00400600
[    1.707205] nouveau T[   VBIOS][0000:01:00.0] 0x4f79[2]: NV_REG   
R[0x40614300] &= 0xfcf3ffff |= 0x00040000
[    1.707207] nouveau T[   VBIOS][0000:01:00.0] 0x4f86[2]: DONE
[    1.707208] nouveau T[   VBIOS][0000:01:00.0] 0x5471[1]: DONE
[    1.707209] nouveau T[   VBIOS][0000:01:00.0] 0x541a[0]: DONE
[    1.707486] nouveau D[   PDISP][0000:01:00.0] supervisor 0x00000040
0x000002b0
[    1.707505] nouveau T[   VBIOS][0000:01:00.0] 0x4f87[0]: SUB_DIRECT   
0x4f9c
[    1.707506] nouveau T[   VBIOS][0000:01:00.0] 0x4f9c[1]: CONDITION_TIME   
0x05 0xff
[    1.707508] nouveau T[   VBIOS][0000:01:00.0] 0x4f9f[1]:     [0x05]
(R[0x4061c030] & 0x10000000) == 0x00000000
[    1.707511] nouveau T[   VBIOS][0000:01:00.0] 0x4f9f[1]: RESUME
[    1.707512] nouveau T[   VBIOS][0000:01:00.0] 0x4fa0[1]: DONE
[    1.707512] nouveau T[   VBIOS][0000:01:00.0] 0x4f8a[0]: SUB_DIRECT   
0x4fa1
[    1.707513] nouveau T[   VBIOS][0000:01:00.0] 0x4fa1[1]: NV_REG   
R[0x4061c10c] &= 0xfffffffe |= 0x00000000
[    1.707516] nouveau T[   VBIOS][0000:01:00.0] 0x4fae[1]: DONE
[    1.707517] nouveau T[   VBIOS][0000:01:00.0] 0x4f8d[0]: DONE


And also the non-working one happens later in the driver load process... I
think. (Also the commit description mentions something about that, so not
unexpected.) What _is_ unexpected is that the non-working one executes a
boatload more scripts. Will compare the script dispatch mechanisms... perhaps
the new code is missing a 'break' somewhere.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392266048.28fdfef83.11050
Date: Thu, 13 Feb 2014 04:34:08 +0000
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
   title="NEW --- - [NVC1] [BISECTED] Monitor on Display port shows distortions"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67628#c18">Comment # 18</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] [BISECTED] Monitor on Display port shows distortions"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67628">bug 67628</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Looking at the earlier vbios execution logs:

working:

[    5.517869] nouveau D[   PDISP][0000:01:00.0] supervisor 0x00000010
0x000002a0
[    5.517885] nouveau T[   VBIOS][0000:01:00.0] 0x568f[0]: DONE
[    5.539255] nouveau D[   PDISP][0000:01:00.0] supervisor 0x00000020
0x000002b0
[    5.539272] nouveau T[   VBIOS][0000:01:00.0] 0x5690[0]: NV_REG   
R[0x4061c00c] &amp;= 0xfffffffe |= 0x00000001
[    5.539276] nouveau T[   VBIOS][0000:01:00.0] 0x569d[0]: NV_REG   
R[0x4061c014] &amp;= 0xff3fffff |= 0x00c00000
[    5.539279] nouveau T[   VBIOS][0000:01:00.0] 0x56aa[0]: DONE
[    5.539332] nouveau D[   PDISP][0000:01:00.0] supervisor 0x00000040
0x000002b0

non-working:

[    1.679797] nouveau D[   PDISP][0000:01:00.0] supervisor 0x00000010
0x000002a0
[    1.679816] nouveau T[   VBIOS][0000:01:00.0] 0x568f[0]: DONE
[    1.707114] nouveau D[   PDISP][0000:01:00.0] supervisor 0x00000020
0x000002b0
[    1.707128] nouveau T[   VBIOS][0000:01:00.0] 0x5690[0]: NV_REG   
R[0x4061c00c] &amp;= 0xfffffffe |= 0x00000001
[    1.707133] nouveau T[   VBIOS][0000:01:00.0] 0x569d[0]: NV_REG   
R[0x4061c014] &amp;= 0xff3fffff |= 0x00c00000
[    1.707136] nouveau T[   VBIOS][0000:01:00.0] 0x56aa[0]: DONE
[    1.707162] nouveau T[   VBIOS][0000:01:00.0] 0x53c8[0]: ZM_REG_SEQUENCE   
0x04
[    1.707163] nouveau T[   VBIOS][0000:01:00.0] 0x53ce[0]:         R[0x61c00c]
= 0x01000000
[    1.707164] nouveau T[   VBIOS][0000:01:00.0] 0x53d2[0]:         R[0x61c010]
= 0x00101500
[    1.707165] nouveau T[   VBIOS][0000:01:00.0] 0x53d6[0]:         R[0x61c014]
= 0x00000000
[    1.707166] nouveau T[   VBIOS][0000:01:00.0] 0x53da[0]:         R[0x61c018]
= 0x00245af8
[    1.707166] nouveau T[   VBIOS][0000:01:00.0] 0x53de[0]: ZM_REG_SEQUENCE   
0x02
[    1.707167] nouveau T[   VBIOS][0000:01:00.0] 0x53e4[0]:         R[0x61c118]
= 0x27272727
[    1.707168] nouveau T[   VBIOS][0000:01:00.0] 0x53e8[0]:         R[0x61c11c]
= 0x00000027
[    1.707169] nouveau T[   VBIOS][0000:01:00.0] 0x53ec[0]: ZM_REG_SEQUENCE   
0x02
[    1.707169] nouveau T[   VBIOS][0000:01:00.0] 0x53f2[0]:         R[0x61c198]
= 0x27272727
[    1.707170] nouveau T[   VBIOS][0000:01:00.0] 0x53f6[0]:         R[0x61c19c]
= 0x00000027
[    1.707171] nouveau T[   VBIOS][0000:01:00.0] 0x53fa[0]: NV_REG   
R[0x61c120] &amp;= 0xffffffff |= 0x00000000
[    1.707175] nouveau T[   VBIOS][0000:01:00.0] 0x5407[0]: NV_REG   
R[0x61c1a0] &amp;= 0xffffffff |= 0x00000000
[    1.707178] nouveau T[   VBIOS][0000:01:00.0] 0x5414[0]: SUB_DIRECT   
0x5cb0
[    1.707179] nouveau T[   VBIOS][0000:01:00.0] 0x5cb0[1]: DONE
[    1.707180] nouveau T[   VBIOS][0000:01:00.0] 0x5417[0]: SUB_DIRECT   
0x546e
[    1.707180] nouveau T[   VBIOS][0000:01:00.0] 0x546e[1]: SUB_DIRECT   
0x4f5c
[    1.707181] nouveau T[   VBIOS][0000:01:00.0] 0x4f5c[2]: SUB_DIRECT   
0x56ab
[    1.707182] nouveau T[   VBIOS][0000:01:00.0] 0x56ab[3]: ZM_REG_SEQUENCE   
0x10
[    1.707183] nouveau T[   VBIOS][0000:01:00.0] 0x56b1[3]:        
R[0x4061c040] = 0x1f0b0000
[    1.707184] nouveau T[   VBIOS][0000:01:00.0] 0x56b5[3]:        
R[0x4061c044] = 0x1f0a0000
[    1.707184] nouveau T[   VBIOS][0000:01:00.0] 0x56b9[3]:        
R[0x4061c048] = 0x1e080000
[    1.707185] nouveau T[   VBIOS][0000:01:00.0] 0x56bd[3]:        
R[0x4061c04c] = 0x1e042000
[    1.707186] nouveau T[   VBIOS][0000:01:00.0] 0x56c1[3]:        
R[0x4061c050] = 0x00008000
[    1.707187] nouveau T[   VBIOS][0000:01:00.0] 0x56c5[3]:        
R[0x4061c054] = 0x00008000
[    1.707188] nouveau T[   VBIOS][0000:01:00.0] 0x56c9[3]:        
R[0x4061c058] = 0x00008000
[    1.707188] nouveau T[   VBIOS][0000:01:00.0] 0x56cd[3]:        
R[0x4061c05c] = 0x00008000
[    1.707189] nouveau T[   VBIOS][0000:01:00.0] 0x56d1[3]:        
R[0x4061c060] = 0x00002000
[    1.707190] nouveau T[   VBIOS][0000:01:00.0] 0x56d5[3]:        
R[0x4061c064] = 0x1f002000
[    1.707191] nouveau T[   VBIOS][0000:01:00.0] 0x56d9[3]:        
R[0x4061c068] = 0x1f0c0000
[    1.707191] nouveau T[   VBIOS][0000:01:00.0] 0x56dd[3]:        
R[0x4061c06c] = 0x1f0a0000
[    1.707192] nouveau T[   VBIOS][0000:01:00.0] 0x56e1[3]:        
R[0x4061c070] = 0x1f0b8000
[    1.707193] nouveau T[   VBIOS][0000:01:00.0] 0x56e5[3]:        
R[0x4061c074] = 0x1f0b8000
[    1.707194] nouveau T[   VBIOS][0000:01:00.0] 0x56e9[3]:        
R[0x4061c078] = 0x1f0b8000
[    1.707195] nouveau T[   VBIOS][0000:01:00.0] 0x56ed[3]:        
R[0x4061c07c] = 0x1f0b8000
[    1.707195] nouveau T[   VBIOS][0000:01:00.0] 0x56f1[3]: DONE
[    1.707196] nouveau T[   VBIOS][0000:01:00.0] 0x4f5f[2]: NV_REG   
R[0x4061c130] &amp;= 0xffbf00ff |= 0x00400600
[    1.707201] nouveau T[   VBIOS][0000:01:00.0] 0x4f6c[2]: NV_REG   
R[0x4061c1b0] &amp;= 0xffbf00ff |= 0x00400600
[    1.707205] nouveau T[   VBIOS][0000:01:00.0] 0x4f79[2]: NV_REG   
R[0x40614300] &amp;= 0xfcf3ffff |= 0x00040000
[    1.707207] nouveau T[   VBIOS][0000:01:00.0] 0x4f86[2]: DONE
[    1.707208] nouveau T[   VBIOS][0000:01:00.0] 0x5471[1]: DONE
[    1.707209] nouveau T[   VBIOS][0000:01:00.0] 0x541a[0]: DONE
[    1.707486] nouveau D[   PDISP][0000:01:00.0] supervisor 0x00000040
0x000002b0
[    1.707505] nouveau T[   VBIOS][0000:01:00.0] 0x4f87[0]: SUB_DIRECT   
0x4f9c
[    1.707506] nouveau T[   VBIOS][0000:01:00.0] 0x4f9c[1]: CONDITION_TIME   
0x05 0xff
[    1.707508] nouveau T[   VBIOS][0000:01:00.0] 0x4f9f[1]:     [0x05]
(R[0x4061c030] &amp; 0x10000000) == 0x00000000
[    1.707511] nouveau T[   VBIOS][0000:01:00.0] 0x4f9f[1]: RESUME
[    1.707512] nouveau T[   VBIOS][0000:01:00.0] 0x4fa0[1]: DONE
[    1.707512] nouveau T[   VBIOS][0000:01:00.0] 0x4f8a[0]: SUB_DIRECT   
0x4fa1
[    1.707513] nouveau T[   VBIOS][0000:01:00.0] 0x4fa1[1]: NV_REG   
R[0x4061c10c] &amp;= 0xfffffffe |= 0x00000000
[    1.707516] nouveau T[   VBIOS][0000:01:00.0] 0x4fae[1]: DONE
[    1.707517] nouveau T[   VBIOS][0000:01:00.0] 0x4f8d[0]: DONE


And also the non-working one happens later in the driver load process... I
think. (Also the commit description mentions something about that, so not
unexpected.) What _is_ unexpected is that the non-working one executes a
boatload more scripts. Will compare the script dispatch mechanisms... perhaps
the new code is missing a 'break' somewhere.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392266048.28fdfef83.11050--

--===============1027472124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1027472124==--
