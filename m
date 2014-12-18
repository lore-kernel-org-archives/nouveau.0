From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87436] INVALID_STATE [UNK05] chid 0 mthd 0x0080 data
	0x00000000
Date: Thu, 18 Dec 2014 13:02:13 +0000
Message-ID: <bug-87436-8800-ZuVR7tJEBh@http.bugs.freedesktop.org/>
References: <bug-87436-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0851440427=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87436-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0851440427==
Content-Type: multipart/alternative; boundary="1418907733.8b32C0A41.2451"; charset="UTF-8"


--1418907733.8b32C0A41.2451
Date: Thu, 18 Dec 2014 13:02:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87436

Laurent Bigonville <l.bigonville-/PFmmAUIoI+zQB+pC5nmwQ@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #110979|0                           |1
        is obsolete|                            |

--- Comment #4 from Laurent Bigonville <l.bigonville-/PFmmAUIoI+zQB+pC5nmwQ@public.gmane.org> ---
Created attachment 110987
  --> https://bugs.freedesktop.org/attachment.cgi?id=110987&action=edit
full dmesg output, really

third time's a charm...

I don't remember doing anything special regarding the video output at that
time, just running dmesg after updating my kernel to see if the wifi
disconnections messages were gone (as you can see they aren't, but that's an
other story).

I didn't notice any functional issues after seeing these messages, but I still
thought it was interesting to report them...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1418907733.8b32C0A41.2451
Date: Thu, 18 Dec 2014 13:02:13 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:l.bigonville&#64;edpnet.be" title="Laurent Bigonville &lt;l.bigonville&#64;edpnet.be&gt;"> <span class="fn">Laurent Bigonville</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - INVALID_STATE [UNK05] chid 0 mthd 0x0080 data 0x00000000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87436">bug 87436</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Attachment #110979 is obsolete</td>
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
   title="NEW - INVALID_STATE [UNK05] chid 0 mthd 0x0080 data 0x00000000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87436#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - INVALID_STATE [UNK05] chid 0 mthd 0x0080 data 0x00000000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87436">bug 87436</a>
              from <span class="vcard"><a class="email" href="mailto:l.bigonville&#64;edpnet.be" title="Laurent Bigonville &lt;l.bigonville&#64;edpnet.be&gt;"> <span class="fn">Laurent Bigonville</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=110987" name="attach_110987" title="full dmesg output, really">attachment 110987</a> <a href="attachment.cgi?id=110987&amp;action=edit" title="full dmesg output, really">[details]</a></span>
full dmesg output, really

third time's a charm...

I don't remember doing anything special regarding the video output at that
time, just running dmesg after updating my kernel to see if the wifi
disconnections messages were gone (as you can see they aren't, but that's an
other story).

I didn't notice any functional issues after seeing these messages, but I still
thought it was interesting to report them...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1418907733.8b32C0A41.2451--

--===============0851440427==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0851440427==--
