From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77333] Xorg segfaults trying to use nouveau GK208 as
 offloadsink provider
Date: Fri, 11 Apr 2014 16:33:29 +0000
Message-ID: <bug-77333-8800-kQKmjQs2V0@http.bugs.freedesktop.org/>
References: <bug-77333-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1273768815=="
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


--===============1273768815==
Content-Type: multipart/alternative; boundary="1397234009.cD6cFeD31.32484"; charset="us-ascii"


--1397234009.cD6cFeD31.32484
Date: Fri, 11 Apr 2014 16:33:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77333

Nirbheek Chauhan <nirbheek.chauhan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
  Attachment #97224|0                           |1
        is obsolete|                            |

--- Comment #4 from Nirbheek Chauhan <nirbheek.chauhan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 97228
  --> https://bugs.freedesktop.org/attachment.cgi?id=97228&action=edit
DRI_PRIME=1 glxinfo

With xf86-video-nouveau, the segfault goes away, but DRI_PRIME doesn't work
either. Log attached.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397234009.cD6cFeD31.32484
Date: Fri, 11 Apr 2014 16:33:29 +0000
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
   title="NEW --- - Xorg segfaults trying to use nouveau GK208 as offloadsink provider"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77333">bug 77333</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Attachment #97224 is obsolete</td>
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
   title="NEW --- - Xorg segfaults trying to use nouveau GK208 as offloadsink provider"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77333#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Xorg segfaults trying to use nouveau GK208 as offloadsink provider"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77333">bug 77333</a>
              from <span class="vcard"><a class="email" href="mailto:nirbheek.chauhan&#64;gmail.com" title="Nirbheek Chauhan &lt;nirbheek.chauhan&#64;gmail.com&gt;"> <span class="fn">Nirbheek Chauhan</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=97228" name="attach_97228" title="DRI_PRIME=1 glxinfo">attachment 97228</a> <a href="attachment.cgi?id=97228&amp;action=edit" title="DRI_PRIME=1 glxinfo">[details]</a></span>
DRI_PRIME=1 glxinfo

With xf86-video-nouveau, the segfault goes away, but DRI_PRIME doesn't work
either. Log attached.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397234009.cD6cFeD31.32484--

--===============1273768815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1273768815==--
