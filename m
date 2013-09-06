From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69029] [NVA8] GPU lockup since kernel 3.11 upgrade
Date: Fri, 06 Sep 2013 16:16:04 +0000
Message-ID: <bug-69029-8800-RMq29jNBv9@http.bugs.freedesktop.org/>
References: <bug-69029-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2101130886=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69029-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2101130886==
Content-Type: multipart/alternative; boundary="1378484164.3Ec42.8247"; charset="us-ascii"


--1378484164.3Ec42.8247
Date: Fri, 6 Sep 2013 16:16:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69029

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|GT218 (NVA8): GPU lockup    |[NVA8] GPU lockup since
                   |since kernel 3.11 upgrade   |kernel 3.11 upgrade

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
As I think was pointed out on IRC, it'd be great to have a bisect, or a way to
reproduce.

The errors in the log are of the form:

nouveau E[  PGRAPH][0000:01:00.0] TRAP_TPDMA_RT - TP 0 - Unknown fault at
address 0048d59400
nouveau E[  PGRAPH][0000:01:00.0] TRAP_TPDMA_RT - TP 0 - e0c: 00000000, e18:
00000000, e1c: 0010059e, e20: 00002a00, e24: 00030000
nouveau E[  PGRAPH][0000:01:00.0]  TRAP
nouveau E[  PGRAPH][0000:01:00.0] ch 5 [0x000fc34000 gnome-shell[1708]] subc 3
class 0x8597 mthd 0x0f04 data 0x00000000
nouveau E[     PFB][0000:01:00.0] trapped write at 0x0048d59400 on channel
0x0000fc34 [gnome-shell[1708]] PGRAPH/PROP/RT0 reason: PAGE_NOT_PRESENT

There has been some TTM rework in 3.11, perhaps this is a fallout of that.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378484164.3Ec42.8247
Date: Fri, 6 Sep 2013 16:16:04 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA8] GPU lockup since kernel 3.11 upgrade"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69029">bug 69029</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>GT218 (NVA8): GPU lockup since kernel 3.11 upgrade
           </td>
           <td>[NVA8] GPU lockup since kernel 3.11 upgrade
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA8] GPU lockup since kernel 3.11 upgrade"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69029#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA8] GPU lockup since kernel 3.11 upgrade"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69029">bug 69029</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>As I think was pointed out on IRC, it'd be great to have a bisect, or a way to
reproduce.

The errors in the log are of the form:

nouveau E[  PGRAPH][0000:01:00.0] TRAP_TPDMA_RT - TP 0 - Unknown fault at
address 0048d59400
nouveau E[  PGRAPH][0000:01:00.0] TRAP_TPDMA_RT - TP 0 - e0c: 00000000, e18:
00000000, e1c: 0010059e, e20: 00002a00, e24: 00030000
nouveau E[  PGRAPH][0000:01:00.0]  TRAP
nouveau E[  PGRAPH][0000:01:00.0] ch 5 [0x000fc34000 gnome-shell[1708]] subc 3
class 0x8597 mthd 0x0f04 data 0x00000000
nouveau E[     PFB][0000:01:00.0] trapped write at 0x0048d59400 on channel
0x0000fc34 [gnome-shell[1708]] PGRAPH/PROP/RT0 reason: PAGE_NOT_PRESENT

There has been some TTM rework in 3.11, perhaps this is a fallout of that.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378484164.3Ec42.8247--

--===============2101130886==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2101130886==--
