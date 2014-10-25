From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 81136] [NV92] Regression in Linux 3.15: GPU lockup
 after suspend
Date: Sat, 25 Oct 2014 21:30:59 +0000
Message-ID: <bug-81136-8800-8bbZ2zYWLG@http.bugs.freedesktop.org/>
References: <bug-81136-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0518222006=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-81136-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0518222006==
Content-Type: multipart/alternative; boundary="1414272659.0aabdcb2.23028"; charset="UTF-8"


--1414272659.0aabdcb2.23028
Date: Sat, 25 Oct 2014 21:30:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=81136

Ed Santiago <freedesktop-aVMt7ygKTj2t/hvpvFFPbQ@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |freedesktop-aVMt7ygKTj2t/hvpvFFPbQ@public.gmane.org

--- Comment #8 from Ed Santiago <freedesktop-aVMt7ygKTj2t/hvpvFFPbQ@public.gmane.org> ---
Same issue. Dell M4800 with QHD+ display -- NVIDIA Corporation GK106GLM [Quadro
K2100M] (rev a1), 3.16.6-gentoo (I tried 3.17, that didn't even give me a
usable display).

None of the workarounds were effective for me: nouveau.nofbaccel=1 causes
suspend to fail, and so did reverting ecf24de071f4f6cea79ecef5d990794df5875ee1:

   A dependency job for suspend.target failed. See 'journalctl -xn' for
details.
   ...
   Oct 25 15:21:16 hostname kernel: WARNING: CPU: 0 PID: 2852 at lib/iomap.c:43
bad_io_access+0x36/0x38()
   Oct 25 15:21:16 hostname kernel: Bad IO access at port 0x24 (outl(val,port))

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1414272659.0aabdcb2.23028
Date: Sat, 25 Oct 2014 21:30:59 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:freedesktop&#64;edsantiago.com" title="Ed Santiago &lt;freedesktop&#64;edsantiago.com&gt;"> <span class="fn">Ed Santiago</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV92] Regression in Linux 3.15: GPU lockup after suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81136">bug 81136</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>freedesktop&#64;edsantiago.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV92] Regression in Linux 3.15: GPU lockup after suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81136#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV92] Regression in Linux 3.15: GPU lockup after suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81136">bug 81136</a>
              from <span class="vcard"><a class="email" href="mailto:freedesktop&#64;edsantiago.com" title="Ed Santiago &lt;freedesktop&#64;edsantiago.com&gt;"> <span class="fn">Ed Santiago</span></a>
</span></b>
        <pre>Same issue. Dell M4800 with QHD+ display -- NVIDIA Corporation GK106GLM [Quadro
K2100M] (rev a1), 3.16.6-gentoo (I tried 3.17, that didn't even give me a
usable display).

None of the workarounds were effective for me: nouveau.nofbaccel=1 causes
suspend to fail, and so did reverting ecf24de071f4f6cea79ecef5d990794df5875ee1:

   A dependency job for suspend.target failed. See 'journalctl -xn' for
details.
   ...
   Oct 25 15:21:16 hostname kernel: WARNING: CPU: 0 PID: 2852 at lib/iomap.c:43
bad_io_access+0x36/0x38()
   Oct 25 15:21:16 hostname kernel: Bad IO access at port 0x24 (outl(val,port))</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1414272659.0aabdcb2.23028--

--===============0518222006==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0518222006==--
