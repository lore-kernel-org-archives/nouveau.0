From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89558] [NV118] GM108 not supported by nouveau
Date: Sun, 22 Mar 2015 15:33:56 +0000
Message-ID: <bug-89558-8800-qdEmjwCZDp@http.bugs.freedesktop.org/>
References: <bug-89558-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0551422720=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89558-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0551422720==
Content-Type: multipart/alternative; boundary="1427038436.11462.26653"; charset="UTF-8"


--1427038436.11462.26653
Date: Sun, 22 Mar 2015 15:33:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89558

SMF <smf.linux-XZoyATsUNX5Wk0Htik3J/w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |smf.linux-XZoyATsUNX5Wk0Htik3J/w@public.gmane.org

--- Comment #3 from SMF <smf.linux-XZoyATsUNX5Wk0Htik3J/w@public.gmane.org> ---
Created attachment 114524
  --> https://bugs.freedesktop.org/attachment.cgi?id=114524&action=edit
part dmesg log

Hi,
I have a Lenovo Z70-50 with the Intel/Nvidia graphics and I am also interested
in getting the gm108 component functional. I use Linux From Scratch for my
system and so far I have had no luck with getting the Nvidia binary
(NVIDIA-Linux-x86-346.47.run) fuctional ( I have also tried UBUNTU also without
luck). I have however added the 0x118 case option to gm100.c in kernel 3.19.2 (
see attached partial dmesg log ) and I have a script ready to run the MMIOTrace
on my LFS setup.

Have you had any luck obtaining the nv118_fuc409c firmware the nouveau modules
is now requesting?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1427038436.11462.26653
Date: Sun, 22 Mar 2015 15:33:56 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:smf.linux&#64;ntlworld.com" title="SMF &lt;smf.linux&#64;ntlworld.com&gt;"> <span class="fn">SMF</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV118] GM108 not supported by nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89558">bug 89558</a>
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
           <td>smf.linux&#64;ntlworld.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV118] GM108 not supported by nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89558#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV118] GM108 not supported by nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89558">bug 89558</a>
              from <span class="vcard"><a class="email" href="mailto:smf.linux&#64;ntlworld.com" title="SMF &lt;smf.linux&#64;ntlworld.com&gt;"> <span class="fn">SMF</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=114524" name="attach_114524" title="part dmesg log">attachment 114524</a> <a href="attachment.cgi?id=114524&amp;action=edit" title="part dmesg log">[details]</a></span>
part dmesg log

Hi,
I have a Lenovo Z70-50 with the Intel/Nvidia graphics and I am also interested
in getting the gm108 component functional. I use Linux From Scratch for my
system and so far I have had no luck with getting the Nvidia binary
(NVIDIA-Linux-x86-346.47.run) fuctional ( I have also tried UBUNTU also without
luck). I have however added the 0x118 case option to gm100.c in kernel 3.19.2 (
see attached partial dmesg log ) and I have a script ready to run the MMIOTrace
on my LFS setup.

Have you had any luck obtaining the nv118_fuc409c firmware the nouveau modules
is now requesting?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1427038436.11462.26653--

--===============0551422720==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0551422720==--
