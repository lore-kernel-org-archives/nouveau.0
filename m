From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74164] [NV04] Native monitor resolution missing
Date: Wed, 29 Jan 2014 08:04:32 +0000
Message-ID: <bug-74164-8800-kAdD0seuX2@http.bugs.freedesktop.org/>
References: <bug-74164-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0573951955=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74164-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0573951955==
Content-Type: multipart/alternative; boundary="1390982672.De4Baca1.28793"; charset="us-ascii"


--1390982672.De4Baca1.28793
Date: Wed, 29 Jan 2014 08:04:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74164

--- Comment #8 from Mauro Molinari <mauromol-IWqWACnzNjyonA0d6jMUrA@public.gmane.org> ---
Created attachment 92971
  --> https://bugs.freedesktop.org/attachment.cgi?id=92971&action=edit
Output of "monitor-get-edid -v >monitor-get-edid.bin"

Here is the output of "monitor-get-edid -v >monitor-get-edid.bin". This command
also produced the following output on the console:

probing EDID using VBE (port 0)
VBE version: 3.0, oem version = 2.4
Memory: 4096k
OEM name: NVidia
Vendor name: NVidia
Product name: Riva TNT
Product revision: A5
Port 0:
  DDC1 not supported
  DDC2 supported
  Screen not blanked during data transfer
  Time to transfer one EDID block: 1 sec (rounded up)

Please note that to successfully execute this command I have to previously do:

setsebool mmap_low_allowed 1

otherwise the invocation of monitor-get-edid prints:

probing EDID using VBE (port 0)
mmap /dev/mem: Permission denied
VBE: could not initialize LRMI
VBE info call failed, skipping all ports

The monitor-get-edid command comes from Fedora "monitor-edid" package. A "yum
info monitor-edid" produces:

Name        : monitor-edid
Arch        : i686
Version     : 3.0
Release     : 6.fc19
Size        : 119 k
Repo        : installed
From repo   : fedora
Summary     : Tool for probing and parsing monitor EDID
URL         : http://wiki.mandriva.com/en/Tools/monitor-edid
Licence     : GPLv3+
Description : Monitor-edid is a tool for probing and parsing Extended display
            : identification data (EDID) from monitors.
            : For more information about EDID, see
            : http://en.wikipedia.org/wiki/EDID

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390982672.De4Baca1.28793
Date: Wed, 29 Jan 2014 08:04:32 +0000
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
   title="NEW --- - [NV04] Native monitor resolution missing"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74164#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV04] Native monitor resolution missing"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74164">bug 74164</a>
              from <span class="vcard"><a class="email" href="mailto:mauromol&#64;tiscali.it" title="Mauro Molinari &lt;mauromol&#64;tiscali.it&gt;"> <span class="fn">Mauro Molinari</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=92971" name="attach_92971" title="Output of &quot;monitor-get-edid -v &gt;monitor-get-edid.bin&quot;">attachment 92971</a> <a href="attachment.cgi?id=92971&amp;action=edit" title="Output of &quot;monitor-get-edid -v &gt;monitor-get-edid.bin&quot;">[details]</a></span>
Output of &quot;monitor-get-edid -v &gt;monitor-get-edid.bin&quot;

Here is the output of &quot;monitor-get-edid -v &gt;monitor-get-edid.bin&quot;. This command
also produced the following output on the console:

probing EDID using VBE (port 0)
VBE version: 3.0, oem version = 2.4
Memory: 4096k
OEM name: NVidia
Vendor name: NVidia
Product name: Riva TNT
Product revision: A5
Port 0:
  DDC1 not supported
  DDC2 supported
  Screen not blanked during data transfer
  Time to transfer one EDID block: 1 sec (rounded up)

Please note that to successfully execute this command I have to previously do:

setsebool mmap_low_allowed 1

otherwise the invocation of monitor-get-edid prints:

probing EDID using VBE (port 0)
mmap /dev/mem: Permission denied
VBE: could not initialize LRMI
VBE info call failed, skipping all ports

The monitor-get-edid command comes from Fedora &quot;monitor-edid&quot; package. A &quot;yum
info monitor-edid&quot; produces:

Name        : monitor-edid
Arch        : i686
Version     : 3.0
Release     : 6.fc19
Size        : 119 k
Repo        : installed
From repo   : fedora
Summary     : Tool for probing and parsing monitor EDID
URL         : <a href="http://wiki.mandriva.com/en/Tools/monitor-edid">http://wiki.mandriva.com/en/Tools/monitor-edid</a>
Licence     : GPLv3+
Description : Monitor-edid is a tool for probing and parsing Extended display
            : identification data (EDID) from monitors.
            : For more information about EDID, see
            : <a href="http://en.wikipedia.org/wiki/EDID">http://en.wikipedia.org/wiki/EDID</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390982672.De4Baca1.28793--

--===============0573951955==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0573951955==--
