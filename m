From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77333] Unable to use nouveau GK208 as offloadsink
	provider
Date: Sat, 12 Apr 2014 07:48:26 +0000
Message-ID: <bug-77333-8800-1wxpGxyzfN@http.bugs.freedesktop.org/>
References: <bug-77333-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1479796739=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77333-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1479796739==
Content-Type: multipart/alternative; boundary="1397288906.eebE8f3D1.20200"; charset="us-ascii"


--1397288906.eebE8f3D1.20200
Date: Sat, 12 Apr 2014 07:48:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77333

Nirbheek Chauhan <nirbheek.chauhan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
  Attachment #97223|0                           |1
        is obsolete|                            |

--- Comment #5 from Nirbheek Chauhan <nirbheek.chauhan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 97250
  --> https://bugs.freedesktop.org/attachment.cgi?id=97250&action=edit
dmesg | grep -E "nouveau|drm" -- drm-next + nouveau.config=NvGrUseFW=1

Situation does not change with a kernel compiled from commit c39b0695 on
drm-next, and by using external firmware.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397288906.eebE8f3D1.20200
Date: Sat, 12 Apr 2014 07:48:26 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:nirbheek.chauhan&#64;gmail.com" title="Nirbheek Chauhan &lt;nirbheek.chauhan&#64;gmail.com&gt;"> <span class="fn">Nirbheek Chauhan</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Unable to use nouveau GK208 as offloadsink provider"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77333">bug 77333</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Attachment #97223 is obsolete</td>
           <td>
               &nbsp;
           </td>
           <td>1
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Unable to use nouveau GK208 as offloadsink provider"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77333#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Unable to use nouveau GK208 as offloadsink provider"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77333">bug 77333</a>
              from <span class="vcard"><a class="email" href="mailto:nirbheek.chauhan&#64;gmail.com" title="Nirbheek Chauhan &lt;nirbheek.chauhan&#64;gmail.com&gt;"> <span class="fn">Nirbheek Chauhan</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=97250" name="attach_97250" title="dmesg | grep -E &quot;nouveau|drm&quot; -- drm-next + nouveau.config=NvGrUseFW=1">attachment 97250</a> <a href="attachment.cgi?id=97250&amp;action=edit" title="dmesg | grep -E &quot;nouveau|drm&quot; -- drm-next + nouveau.config=NvGrUseFW=1">[details]</a></span>
dmesg | grep -E &quot;nouveau|drm&quot; -- drm-next + nouveau.config=NvGrUseFW=1

Situation does not change with a kernel compiled from commit c39b0695 on
drm-next, and by using external firmware.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397288906.eebE8f3D1.20200--

--===============1479796739==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1479796739==--
