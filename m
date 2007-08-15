From: Karel =?iso-8859-1?q?Voln=FD?= <kvolny-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: suggestions for createdump.sh improvements
Date: Wed, 15 Aug 2007 09:30:49 +0200
Message-ID: <200708150930.49750.kvolny@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
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


Hi,

recently I've tried the script createdump.sh and I have some suggestions:

* it would be nice if the script is able to detect missing prerequisites and 
to suggest to install appropriate packages (as with cvs), namely
- SDL-devel
- libXvMC-devel
(the names will differ from distro to distro, but it can make a good starting 
point; other ones come as dependencies, at least in my case)

* it would be nice if the script is able to detect 
missing /usr/lib[64]/libXvMCNVIDIA.so and to suggest correction; see 
http://nouveau.freedesktop.org/wiki/FAQ#head-e93d5298a66baa16293c8bc0be05c9f08b0140e8
(note: on my system, the library is /usr/lib64/nvidia/libXvMCNVIDIA.so - no 
version in the name, but located within superfluous subdirectory)

* using non-english locale, dialog displays localised strings for "Yes" 
and "No" so relying on the exact button labels within the text of messages 
looks at least very funny ...


Regards,
K.V.
